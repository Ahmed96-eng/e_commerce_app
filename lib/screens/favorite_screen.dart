import 'package:ecommerceapp/provider/homeProvider.dart';
import 'package:ecommerceapp/screens/home_screen.dart';
import 'package:ecommerceapp/screens/productDetails.dart';
import 'package:ecommerceapp/widget/appBar_widget.dart';
import 'package:ecommerceapp/widget/bottom_bar_widget.dart';
import 'package:ecommerceapp/widget/favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  static const route = 'favorite_screen';
  @override
  Widget build(BuildContext context) {
    Future<bool> _willPopScope() async {
      Navigator.of(context).pop();
      return true;
    }

    return Consumer<HomeProvider>(
      builder: (context, homrProvider, child) => WillPopScope(
        onWillPop: _willPopScope,
        child: SafeArea(
          child: Scaffold(
            appBar: appBarWidgit(
                context,
                'Favorite Screen',
                homrProvider.favoriteCount.toString(),
                homrProvider.cartCount.toString()),
            body: ListView.builder(
              itemCount: homrProvider.favoriteItems.length,
              itemBuilder: (context, index) => FavoriteItem(
                id: homrProvider.favoriteItems.values
                    .toList()[index]
                    .id
                    .toString(),
                productKey: homrProvider.favoriteItems.keys.toList()[index],
                title: homrProvider.favoriteItems.values.toList()[index].title,
                imageUrl:
                    homrProvider.favoriteItems.values.toList()[index].imageUrl,
                price: homrProvider.favoriteItems.values.toList()[index].price,
                description: homrProvider.favoriteItems.values
                    .toList()[index]
                    .description,
                quantity:
                    homrProvider.favoriteItems.values.toList()[index].quantity,
              ),
            ),
            // bottomNavigationBar: BottomNavBarWidget(),
          ),
        ),
      ),
    );
  }
}
