import 'dart:io';

import 'package:ecommerceapp/screens/cart_screen.dart';
import 'package:ecommerceapp/widget/shared_widget.dart';
import 'package:flutter/material.dart';
import './home_screen.dart';

import './favorite_screen.dart';
import './profile_screen.dart';

class BottomBarScreen extends StatefulWidget {
  static const route = 'bottom_bar_screen';
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _pageIndex = 0;

  List<Map<String, Object>> _pages = [
    {'page': HomeScreen()},
    {'page': FavoriteScreen()},
    {'page': CartScreen()},
    {'page': ProfileScreen()},
  ];
  void _selectPage(int index) {
    setState(() {
      _pageIndex = index;
    });
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
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: _pages[_pageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          type: BottomNavigationBarType.shifting,
          backgroundColor: Theme.of(context).primaryColor,
//        backgroundColor: Colors.white,
          selectedItemColor: Colors.redAccent.withOpacity(0.9),
          unselectedItemColor: Colors.grey,
          currentIndex: _pageIndex,
          onTap: _selectPage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Favorite'),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text('Cart'),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Profile'),
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
