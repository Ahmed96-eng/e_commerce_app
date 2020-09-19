import 'package:ecommerceapp/provider/homeProvider.dart';
import 'package:ecommerceapp/screens/Snackers.dart';
import 'package:ecommerceapp/screens/cart_screen.dart';
import 'package:ecommerceapp/screens/favorite_screen.dart';
import 'package:ecommerceapp/screens/jackets.dart';
import 'package:ecommerceapp/screens/shirts.dart';
import 'package:ecommerceapp/screens/watch.dart';
import 'package:ecommerceapp/widget/badge.dart';
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

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return DefaultTabController(
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
                                'https://upload.wikimedia.org/wikipedia/commons/f/f7/Mozilla_Thunderbird_logo.png'),
                        customTabs(
                            title: 'Watch',
                            imageUrl:
                                'https://upload.wikimedia.org/wikipedia/commons/f/f7/Mozilla_Thunderbird_logo.png'),
                        customTabs(
                            title: 'jaket',
                            imageUrl:
                                'https://upload.wikimedia.org/wikipedia/commons/f/f7/Mozilla_Thunderbird_logo.png'),
                        customTabs(
                            title: 'Shirt',
                            imageUrl:
                                'https://upload.wikimedia.org/wikipedia/commons/f/f7/Mozilla_Thunderbird_logo.png'),
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
      ),
    );
  }
}
