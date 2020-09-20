import 'dart:math';

import 'package:ecommerceapp/model/order.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderItem extends StatefulWidget {
  final Order order;
  OrderItem(this.order);
  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _expand = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
      child: Card(
        // color: Colors.redAccent[400].withOpacity(0.3),
        color: Colors.grey[200].withOpacity(0.9),
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            ListTile(
                title: Text(
                  "# ${widget.order.id.toString()}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  DateFormat("yyyy/MM/dd   hh:mm")
                      .format(widget.order.dateTime),
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                trailing: IconButton(
                    icon: _expand
                        ? Icon(Icons.expand_less)
                        : Icon(Icons.expand_more),
                    onPressed: () {
                      setState(() {
                        _expand = !_expand;
                      });
                    })),
            Divider(
              height: 8,
              thickness: 5,
              color: Colors.redAccent.withOpacity(0.6),
            ),
            _expand
                ? Container(
                    color: Colors.redAccent.withOpacity(0.3),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                    height:
                        min(widget.order.cartProducts.length * 20.0 + 25, 200),
                    child: ListView(
                      children: widget.order.cartProducts
                          .map(
                            (product) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    product.title,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${product.quantity}x \$${product.price}',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
