import 'package:ecommerceapp/provider/homeProvider.dart';
import 'package:ecommerceapp/screens/bottom_bar_screen.dart';
import 'package:ecommerceapp/screens/home_screen.dart';
import 'package:ecommerceapp/widget/order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  static const route = 'order_screen';
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Screen'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(HomeScreen.route);
            }),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) => ListView.builder(
          itemBuilder: (context, index) =>
              OrderItem(homeProvider.orders[index]),
          itemCount: homeProvider.orders.length,
        ),
      ),
    );
  }
}
