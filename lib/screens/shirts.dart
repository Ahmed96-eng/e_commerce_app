import 'package:ecommerceapp/provider/homeProvider.dart';
import 'package:ecommerceapp/screens/productDetails.dart';
import 'package:ecommerceapp/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShirtScreen extends StatefulWidget {
  String searchName;
  ShirtScreen({this.searchName});
  @override
  _ShirtScreenState createState() => _ShirtScreenState();
}

class _ShirtScreenState extends State<ShirtScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) => ListView.builder(
        itemCount: homeProvider.shirtItems.length,
        itemBuilder: (context, index) => homeProvider.shirtItems[index].title
                .toLowerCase()
                .contains(widget.searchName)
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: ProductItem(
                    id: homeProvider.shirtItems[index].id,
                    title: homeProvider.shirtItems[index].title,
                    imagUrl: homeProvider.shirtItems[index].imageUrl,
                    price: homeProvider.shirtItems[index].price,
                    quantity: homeProvider.shirtItems[index].quantity,
                  ),
                  onTap: () {
                    print('ONTAPPED ${homeProvider.shirtItems[index].id}');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetails(
                                  id: homeProvider.shirtItems[index].id,
                                  title: homeProvider.shirtItems[index].title,
                                  imagUrl:
                                      homeProvider.shirtItems[index].imageUrl,
                                  price: homeProvider.shirtItems[index].price,
                                  description: homeProvider
                                      .shirtItems[index].description,
                                  quantity:
                                      homeProvider.shirtItems[index].quantity,
                                )));
                  },
                ),
              )
            : Container(),
      ),
    );
  }
}
