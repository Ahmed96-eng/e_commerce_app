import 'package:ecommerceapp/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/favorite_screen.dart';
import '../screens/profile_screen.dart';

// ignore: must_be_immutable
class BottomNavBarWidget extends StatefulWidget {
  static const route = 'bottom_bar_widget';
  int pageIndex;
  BottomNavBarWidget({this.pageIndex});
  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int _pageIndex = 0;

  // List<Map<String, Object>> _pages = [
  //   {'page0': HomeScreen()},
  //   {'page1': FavoriteScreen()},
  //   {'page2': CartScreen()},
  //   {'page3': ProfileScreen()},
  // ];

  List<Widget> pages = [
    HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  void _selectPage(int index) {
    setState(() {
      _pageIndex = index;
      pages[index].toString();
    });

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => pages[index]));
    // if (index == 0) {
    //   // Navigator.of(context).pushNamed(HomeScreen.route);
    //   _pages[widget.pageIndex];
    // } else if (index == 1) {
    //   // Navigator.of(context).pushNamed(FavoriteScreen.route);
    //   _pages[widget.pageIndex];
    // } else if (index == 2) {
    //   // Navigator.of(context).pushNamed(CartScreen.route);
    //   pages[widget.pageIndex];
    // } else {
    //   // Navigator.of(context).pushNamed(ProfileScreen.route);
    //   pages[widget.pageIndex];
    // }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 30,
      type: BottomNavigationBarType.shifting,
      // backgroundColor: Theme.of(context).primaryColor,
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
    );
  }
}
