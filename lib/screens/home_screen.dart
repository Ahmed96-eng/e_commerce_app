import 'dart:io';
import 'package:ecommerceapp/provider/homeProvider.dart';
import 'package:ecommerceapp/screens/product_dashboard_screen.dart';
import 'package:ecommerceapp/screens/products_screen.dart';
import 'package:ecommerceapp/screens/cart_screen.dart';
import 'package:ecommerceapp/screens/favorite_screen.dart';
import 'package:ecommerceapp/widget/badge.dart';
import 'package:ecommerceapp/widget/custom_tabs.dart';
import 'package:ecommerceapp/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const route = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String categoryName = 'snacker';
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            // backgroundColor: Colors.redAccent.withOpacity(0.4),
            backgroundColor: Colors.red[300],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            title: new Text(
              "Exit Application",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24),
            ),
            content: new Text(
              "Are You Sure?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                shape: StadiumBorder(),
                color: Colors.white,
                child: new Text(
                  "Yes",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  exit(0);
                },
              ),
              FlatButton(
                shape: StadiumBorder(),
                color: Colors.white,
                child: new Text(
                  "No",
                  style: TextStyle(color: Colors.black54),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          title: Text('My Shop'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: homeProvider.categories.length,
                itemBuilder: (context, index) => InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: customTabs(
                        title: homeProvider.categories[index],
                        imageUrl: homeProvider.imageCategories[index]),
                  ),
                  onTap: () {
                    setState(() {
                      categoryName = homeProvider.categories[index];
                    });
                  },
                ),
              ),
            ),
          ),
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
              value: homeProvider.favoriteCount.toString(),
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
              value: homeProvider.cartCount.toString(),
            ),
          ],
        ),
        body: ProductScreen(
          product: homeProvider.productCategory(categoryName),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black54,
          child: Icon(Icons.add),
          tooltip: 'Add',
          onPressed: () {
            Navigator.of(context).pushNamed(ProductDashBoardScreen.route);
          },
        ),
      ),
    );
  }
}
// IconButton(
//               icon: Icon(Icons.add),
//               onPressed: () {
//                 Navigator.of(context).pushNamed(ProductDashBoardScreen.route);
//               }),
