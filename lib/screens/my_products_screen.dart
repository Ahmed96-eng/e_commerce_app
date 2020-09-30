import 'package:ecommerceapp/provider/homeProvider.dart';
import 'package:ecommerceapp/screens/home_screen.dart';
import 'package:ecommerceapp/widget/appBar_widget.dart';
import 'package:ecommerceapp/widget/favorite_item.dart';
import 'package:ecommerceapp/widget/my_products_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductsScreen extends StatelessWidget {
  static const route = 'my_product_screen';

  @override
  Widget build(BuildContext context) {
    Future<bool> _willPopScope() async {
      Navigator.of(context).pushNamed(HomeScreen.route);

      return true;
    }

    return Consumer<HomeProvider>(
      builder: (context, homrProvider, child) => WillPopScope(
        onWillPop: _willPopScope,
        child: Scaffold(
          appBar: appBarWidgit(
              context,
              'My Products',
              homrProvider.favoriteCount.toString(),
              homrProvider.cartCount.toString()),
          body: ListView.builder(
            itemCount: homrProvider.products.length,
            itemBuilder: (context, index) => MyProductsItem(
              myProduct: homrProvider.products[index],
            ),
          ),
          // bottomNavigationBar: BottomNavBarWidget(pageIndex: pageIndex),
        ),
      ),
    );
  }
}
