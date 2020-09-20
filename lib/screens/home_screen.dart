import 'dart:io';

import 'package:ecommerceapp/provider/homeProvider.dart';
import 'package:ecommerceapp/screens/Snackers.dart';
import 'package:ecommerceapp/screens/cart_screen.dart';
import 'package:ecommerceapp/screens/favorite_screen.dart';
import 'package:ecommerceapp/screens/jackets.dart';
import 'package:ecommerceapp/screens/profile_screen.dart';
import 'package:ecommerceapp/screens/shirts.dart';
import 'package:ecommerceapp/screens/watch.dart';
import 'package:ecommerceapp/widget/badge.dart';
import 'package:ecommerceapp/widget/bottom_bar_widget.dart';
import 'package:ecommerceapp/widget/custom_tabs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const route = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          // drawer: Drawer(),
          appBar: AppBar(
            title: Text('My Shop'),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(150),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            border: Border.all(color: Colors.redAccent),
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
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TabBar(
                        labelColor: Colors.redAccent.withOpacity(0.9),
                        indicatorPadding: EdgeInsets.only(bottom: -5),
                        isScrollable: true,
                        unselectedLabelColor: Colors.black,
                        indicatorColor: Colors.redAccent.withOpacity(0.9),
                        tabs: [
                          customTabs(
                              title: 'Snackers',
                              imageUrl:
                                  'https://images-na.ssl-images-amazon.com/images/I/611TWd7sDIL._UY500_.jpg'),
                          customTabs(
                              title: 'Watch',
                              imageUrl:
                                  'https://www.amazon.in/images/I/61WixzlVuXL.jpg'),
                          customTabs(
                              title: 'jaket',
                              imageUrl:
                                  'https://cdn-images.farfetch-contents.com/14/70/76/45/14707645_25035903_600.jpg'),
                          customTabs(
                              title: 'Shirt',
                              imageUrl:
                                  'https://lcw.akinoncdn.com/products/2020/03/10/1525250/354b1db1-b122-4130-8cea-2ee8d01d6eac_size561x730.jpg'),
                        ]),
                  ),
                ],
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

          body: TabBarView(
            children: <Widget>[
              SnackerScreen(
                searchName: searchCont.text.toString(),
              ),
              WatchScreen(
                searchName: searchCont.text.toString(),
              ),
              JacketScreen(
                searchName: searchCont.text.toString(),
              ),
              ShirtScreen(
                searchName: searchCont.text.toString(),
              )
            ],
          ),
          bottomNavigationBar: BottomNavBarWidget(),
        ),
      ),
    );
  }
}
