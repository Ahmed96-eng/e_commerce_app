import 'package:ecommerceapp/model/cart.dart';
import 'package:ecommerceapp/model/product.dart';
import 'package:ecommerceapp/provider/homeProvider.dart';
import 'package:ecommerceapp/screens/home_screen.dart';
import 'package:ecommerceapp/screens/order_screen.dart';
import 'package:ecommerceapp/screens/productDetails.dart';
import 'package:ecommerceapp/widget/appBar_widget.dart';
import 'package:ecommerceapp/widget/bottom_bar_widget.dart';
import 'package:ecommerceapp/widget/cart_item.dart';
import 'package:ecommerceapp/widget/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  static const route = 'cart_screen';
  // Cart cartProduct;
  // CartScreen({this.cartProduct});
  Product product;

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Future<bool> _willPopScope() async {
    // Navigator.of(context).pop();
    Navigator.of(context).pushNamed(HomeScreen.route);

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
              'Cart Screen',
              homeProvider.favoriteCount.toString(),
              homeProvider.cartCount.toString()),
          body: Column(
            children: [
              Card(
                color: Colors.grey.withOpacity(0.1),
                margin: EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Total',
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Chip(
                        label: Text(
                          ' \$ ' + homeProvider.totalAmount.toStringAsFixed(2),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      FlatButton(
                        child: Text(
                          'Order Now',
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: homeProvider.cartItems.length == 0
                                  ? Colors.grey
                                  : Colors.black),
                        ),
                        onPressed: () {
                          // decress quantity from
                          homeProvider.cartItems.values
                              .map((value) => value.product.stockQuantity -=
                                  value.product.quantity)
                              .toList();

                          if (homeProvider.cartItems.length == 0 ||
                              homeProvider.cartItems.length == null) {
                            return Container();
                          }
                          homeProvider.addOrder(
                            homeProvider.cartItems.values.toList(),
                            homeProvider.totalAmount.toDouble(),
                          );
                          homeProvider.clearCart();

                          // Navigator.of(context).pop();
                          Navigator.of(context).pushNamed(HomeScreen.route);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: homeProvider.cartItems.length,
                    itemBuilder: (context, index) => CartItem(
                          cartProduct:
                              homeProvider.cartItems.values.toList()[index],
                          index: index,
                        )),
              ),
            ],
          ),
          // bottomNavigationBar: BottomNavBarWidget(),
        ),
      ),
    );
  }
}
