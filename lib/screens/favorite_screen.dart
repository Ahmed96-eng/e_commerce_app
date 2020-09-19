import 'package:ecommerceapp/provider/homeProvider.dart';
import 'package:ecommerceapp/screens/bottom_bar_screen.dart';
import 'package:ecommerceapp/screens/productDetails.dart';
import 'package:ecommerceapp/widget/favorite_item.dart';
import 'package:ecommerceapp/widget/shared_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  static const route = 'favorite_screen';
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homrProvider, child) => Scaffold(
        appBar: AppBar(
          title: Text('Favorite Screen'),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(BottomBarScreen.route);
              }),
        ),
        body: ListView.builder(
          itemCount: homrProvider.favoriteItems.length,
          itemBuilder: (context, index) => FavoriteItem(
            id: homrProvider.favoriteItems.values.toList()[index].id.toString(),
            title: homrProvider.favoriteItems.values.toList()[index].title,
            imageUrl:
                homrProvider.favoriteItems.values.toList()[index].imageUrl,
            price: homrProvider.favoriteItems.values.toList()[index].price,
            description:
                homrProvider.favoriteItems.values.toList()[index].description,
            quantity:
                homrProvider.favoriteItems.values.toList()[index].quantity,
          ),
        ),
      ),
    );
  }
}
