import 'package:ecommerceapp/provider/homeProvider.dart';
import 'package:ecommerceapp/screens/productDetails.dart';
import 'package:ecommerceapp/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JacketScreen extends StatefulWidget {
  String searchName;
  JacketScreen({this.searchName});
  @override
  _JacketScreenState createState() => _JacketScreenState();
}

class _JacketScreenState extends State<JacketScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) => ListView.builder(
        itemCount: homeProvider.jacketItems.length,
        itemBuilder: (context, index) => homeProvider.jacketItems[index].title
                .toLowerCase()
                .contains(widget.searchName)
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: ProductItem(
                    id: homeProvider.jacketItems[index].id,
                    title: homeProvider.jacketItems[index].title,
                    imagUrl: homeProvider.jacketItems[index].imageUrl,
                    price: homeProvider.jacketItems[index].price,
                    quantity: homeProvider.jacketItems[index].quantity,
                  ),
                  onTap: () {
                    print('ONTAPPED ${homeProvider.jacketItems[index].id}');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetails(
                                  id: homeProvider.jacketItems[index].id,
                                  title: homeProvider.jacketItems[index].title,
                                  imagUrl:
                                      homeProvider.jacketItems[index].imageUrl,
                                  price: homeProvider.jacketItems[index].price,
                                  description: homeProvider
                                      .jacketItems[index].description,
                                  quantity:
                                      homeProvider.jacketItems[index].quantity,
                                )));
                  },
                ),
              )
            : Container(),
      ),
    );
  }
}
