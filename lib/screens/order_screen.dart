import 'package:ecommerceapp/provider/homeProvider.dart';
import 'package:ecommerceapp/widget/appBar_widget.dart';
import 'package:ecommerceapp/widget/bottom_bar_widget.dart';
import 'package:ecommerceapp/widget/order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  static const route = 'order_screen';
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  Future<bool> _willPopScope() async {
    // Navigator.of(context).pushNamed(HomeScreen.route);
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
    Navigator.of(context).pop();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopScope,
      child: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) => Scaffold(
          appBar: appBarWidgit(
              context,
              'Order Screen',
              homeProvider.favoriteCount.toString(),
              homeProvider.cartCount.toString()),
          // drawer: Drawer(),
          body: ListView.builder(
            itemBuilder: (context, index) =>
                OrderItem(homeProvider.orders[index]),
            itemCount: homeProvider.orders.length,
          ),
          // bottomNavigationBar: BottomNavBarWidget(),
        ),
      ),
    );
  }
}
