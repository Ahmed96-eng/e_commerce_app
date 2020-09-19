import 'package:ecommerceapp/provider/homeProvider.dart';
import 'package:ecommerceapp/screens/home_screen.dart';
import 'package:ecommerceapp/screens/order_screen.dart';
import 'package:ecommerceapp/widget/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  static const route = 'cart_screen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Future<bool> _willPopScope() async {
    Navigator.of(context).pushReplacementNamed(HomeScreen.route);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Consumer<HomeProvider>(
      builder: (context, homrProvider, child) => WillPopScope(
        onWillPop: _willPopScope,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Cart Screen'),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(HomeScreen.route);
                }),
          ),
          body: Column(
            children: [
              Card(
                color: Colors.red[100],
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
                          ' \$ ' + homrProvider.totalAmount.toStringAsFixed(2),
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
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          if (homrProvider.cartItems.length == 0 ||
                              homrProvider.cartItems.length == null) {
                            return;
                          }
                          homrProvider.addOrder(
                              homrProvider.cartItems.values.toList(),
                              homrProvider.totalAmount);
                          homrProvider.clearCart();

                          Navigator.of(context).pushNamed(OrderScreen.route);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: homrProvider.cartItems.length,
                  itemBuilder: (context, index) => Dismissible(
                    key: Key(homrProvider.cartItems.keys.toList()[index]),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Theme.of(context).errorColor,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(16),
                      child: Icon(
                        Icons.delete,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    onDismissed: (direction) {
                      homrProvider.removeCartItem(
                          homrProvider.cartItems.keys.toList()[index]);
                    },
                    confirmDismiss: (direction) {
                      return showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          // backgroundColor: Colors.redAccent.withOpacity(0.4),
                          backgroundColor: Colors.red[300],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          title: new Text(
                            "Are You Sure?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 24),
                          ),
                          content: new Text(
                            "Do you want to remove this item from the cart?!!!",
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
                                Navigator.of(context).pop(true);
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
                                Navigator.of(context).pop(false);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          height: height * 0.2,
                          color: Colors.red[50],
                          // margin: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Container(
                                width: width * 0.3,
                                height: height * 0.2,
                                child: Image.network(
                                  homrProvider.cartItems.values
                                      .toList()[index]
                                      .imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 16),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      homrProvider.cartItems.values
                                          .toList()[index]
                                          .title,
                                      softWrap: true,
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5),
                                    Text('Price: ' +
                                        '\$ ' +
                                        homrProvider.cartItems.values
                                            .toList()[index]
                                            .price
                                            .toString()),
                                    SizedBox(height: 5),
                                    Text(
                                      'TotalProducrPrice: ' +
                                          '\$ ' +
                                          homrProvider
                                              .totalProductPrice(
                                                  homrProvider.cartItems.values
                                                      .toList()[index]
                                                      .price,
                                                  homrProvider.cartItems.values
                                                      .toList()[index]
                                                      .quantity)
                                              .toStringAsFixed(2),
                                      softWrap: true,
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Row(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          // crossAxisAlignment:
                                          //     CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                                icon: Icon(
                                                  Icons.remove_circle,
                                                  size: 30,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    if (homrProvider
                                                            .cartItems.values
                                                            .toList()[index]
                                                            .quantity >
                                                        1)
                                                      homrProvider
                                                          .cartItems.values
                                                          .toList()[index]
                                                          .quantity--;
                                                  });
                                                }),
                                            Text(
                                              homrProvider.cartItems.values
                                                  .toList()[index]
                                                  .quantity
                                                  .toString(),
                                              softWrap: true,
                                              overflow: TextOverflow.fade,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            IconButton(
                                                icon: Icon(
                                                  Icons.add_circle,
                                                  size: 30,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    homrProvider
                                                        .cartItems.values
                                                        .toList()[index]
                                                        .quantity++;
                                                  });
                                                }),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
