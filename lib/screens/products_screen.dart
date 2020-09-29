import 'package:ecommerceapp/model/product.dart';
import 'package:ecommerceapp/provider/homeProvider.dart';
import 'package:ecommerceapp/screens/productDetails.dart';
import 'package:ecommerceapp/widget/product_item.dart';
import 'package:ecommerceapp/widget/shared_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  List<Product> product;
  ProductScreen({this.product});
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TextEditingController searchCont;
  String _searchValue = "";

  @override
  void initState() {
    searchCont = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchCont.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 10, right: 10),
            child: Container(
                height: height * 0.07,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    border: Border.all(
                      color: Colors.redAccent.withOpacity(0.4),
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: searchCont,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.close),
                      color: Colors.black54,
                      onPressed: () {
                        searchCont.clear();
                        setState(() {
                          _searchValue = "";
                        });
                      },
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (String value) {
                    setState(() {
                      _searchValue = value;
                    });
                  },
                )),
          ),
          Container(
            height: height * 0.65,
            child: Consumer<HomeProvider>(
              builder: (context, homeProvider, child) => ListView.builder(
                itemCount: widget.product.length,
                itemBuilder: (context, index) => widget.product[index].title
                        .toLowerCase()
                        .contains(searchCont.text)
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: ProductItem(
                            // id: widget.product[index].id,
                            // title: widget.product[index].title,
                            // imagUrl: widget.product[index].imageUrl,
                            // price: widget.product[index].price,
                            // description: widget.product[index].description,
                            // quantity: widget.product[index].quantity,
                            // isFavorite: widget.product[index].isFavorite,
                            product: widget.product[index],
                            // index: index,
                          ),
                          onTap: () {
                            print(
                                widget.product[index].stockQuantity.toString());
                            SharedStorage()
                                .getcheckFavoritePref(widget.product[index].id);
                            print('ONTAPPED ${widget.product[index].id}');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetails(
                                          // id: widget.product[index].id,
                                          // title: widget.product[index].title,
                                          // imageUrl:
                                          //     widget.product[index].imageUrl,
                                          // price: widget.product[index].price,
                                          // description:
                                          //     widget.product[index].description,
                                          // quantity:
                                          //     widget.product[index].quantity,
                                          // stockQuantity: widget
                                          //     .product[index].stockQuantity,
                                          // isFavorite:
                                          //     widget.product[index].isFavorite,
                                          // file: widget.product[index].file,
                                          product: widget.product[index],
                                        )));
                          },
                        ),
                      )
                    : Container(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
