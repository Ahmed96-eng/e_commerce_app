import 'package:ecommerceapp/provider/homeProvider.dart';
import 'package:ecommerceapp/screens/productDetails.dart';
import 'package:ecommerceapp/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SnackerScreen extends StatefulWidget {
  String searchName;
  SnackerScreen({this.searchName});
  @override
  _SnackerScreenState createState() => _SnackerScreenState();
}

class _SnackerScreenState extends State<SnackerScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) => ListView.builder(
        itemCount: homeProvider.snackersItems.length,
        itemBuilder: (context, index) => homeProvider.snackersItems[index].title
                .toLowerCase()
                .contains(widget.searchName)
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: ProductItem(
                    id: homeProvider.snackersItems[index].id,
                    title: homeProvider.snackersItems[index].title,
                    imagUrl: homeProvider.snackersItems[index].imageUrl,
                    price: homeProvider.snackersItems[index].price,
                    quantity: homeProvider.snackersItems[index].quantity,
                  ),
                  onTap: () {
                    print('ONTAPPED ${homeProvider.snackersItems[index].id}');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetails(
                                  id: homeProvider.snackersItems[index].id,
                                  title:
                                      homeProvider.snackersItems[index].title,
                                  imagUrl: homeProvider
                                      .snackersItems[index].imageUrl,
                                  price:
                                      homeProvider.snackersItems[index].price,
                                  description: homeProvider
                                      .snackersItems[index].description,
                                  quantity: homeProvider
                                      .snackersItems[index].quantity,
                                )));
                  },
                ),
              )
            : Container(),
      ),
    );
  }
}
