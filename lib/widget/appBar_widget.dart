import 'package:ecommerceapp/screens/cart_screen.dart';
import 'package:ecommerceapp/screens/favorite_screen.dart';
import 'package:ecommerceapp/widget/badge.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appBarWidgit(
    BuildContext context, String title, String value, String value2) {
  return AppBar(
    // leading: IconButton(
    //     icon: Icon(Icons.arrow_back),
    //     onPressed: () {
    //       Navigator.of(context).pop();
    //     }),
    title: Text(title),
    actions: [
      Badge(
        child: IconButton(
          icon: Icon(
            Icons.favorite,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(FavoriteScreen.route);
          },
        ),
        value: value,
      ),
      Badge(
        child: IconButton(
          icon: Icon(
            Icons.shopping_cart,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(CartScreen.route);
          },
        ),
        value: value2,
      ),
    ],
  );
}
