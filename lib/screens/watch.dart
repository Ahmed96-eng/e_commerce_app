import 'package:ecommerceapp/provider/homeProvider.dart';
import 'package:ecommerceapp/screens/productDetails.dart';
import 'package:ecommerceapp/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WatchScreen extends StatefulWidget {
  String searchName;
  WatchScreen({this.searchName});
  @override
  _WatchScreenState createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) => ListView.builder(
        itemCount: homeProvider.watchItems.length,
        itemBuilder: (context, index) => homeProvider.watchItems[index].title
                .toLowerCase()
                .contains(widget.searchName)
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: ProductItem(
                    id: homeProvider.watchItems[index].id,
                    title: homeProvider.watchItems[index].title,
                    imagUrl: homeProvider.watchItems[index].imageUrl,
                    price: homeProvider.watchItems[index].price,
                    description: homeProvider.watchItems[index].description,
                    quantity: homeProvider.watchItems[index].quantity,
                  ),
                  onTap: () {
                    print('ONTAPPED ${homeProvider.watchItems[index].id}');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetails(
                                  id: homeProvider.watchItems[index].id,
                                  title: homeProvider.watchItems[index].title,
                                  imagUrl:
                                      homeProvider.watchItems[index].imageUrl,
                                  price: homeProvider.watchItems[index].price,
                                  description: homeProvider
                                      .watchItems[index].description,
                                  quantity:
                                      homeProvider.watchItems[index].quantity,
                                )));
                  },
                ),
              )
            : Container(),
      ),
    );
  }
}
