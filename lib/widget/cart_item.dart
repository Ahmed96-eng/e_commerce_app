import 'package:ecommerceapp/model/cart.dart';
import 'package:ecommerceapp/model/product.dart';
import 'package:ecommerceapp/provider/homeProvider.dart';
import 'package:ecommerceapp/screens/productDetails.dart';
import 'package:ecommerceapp/widget/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  int index;
  Cart cartProduct;
  Product product;
  CartItem({this.cartProduct, this.index});

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    // final homeProvider = Provider.of<HomeProvider>(context, listen: false);

    final homeProvider = Provider.of<HomeProvider>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Dismissible(
      key: Key(homeProvider.cartItems.keys.toList()[widget.index]),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(20),
        child: Icon(
          Icons.delete,
          size: 50,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) {
        homeProvider
            .removeCartItem(homeProvider.cartItems.keys.toList()[widget.index]);
      },
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            // backgroundColor: Colors.redAccent.withOpacity(0.4),
            backgroundColor: Colors.red[300],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
          child: InkWell(
            onTap: () {
              print('ONTAPPED ${widget.cartProduct.product.id}+2@');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetails(
                            product: widget.cartProduct.product,
                            // id: homrProvider.cartItems.values
                            //     .toList()[widget.index]
                            //     .id
                            //     .toString(),
                            // title: homrProvider.cartItems.values
                            //     .toList()[widget.index]
                            //     .title,
                            // imageUrl: homrProvider.cartItems.values
                            //     .toList()[widget.index]
                            //     .imageUrl,
                            // price: homrProvider.cartItems.values
                            //     .toList()[widget.index]
                            //     .price,
                            // description: homrProvider.cartItems.values
                            //         .toList()[widget.index]
                            //         .description ??
                            //     "",
                            // quantity: homrProvider.cartItems.values
                            //     .toList()[widget.index]
                            //     .quantity,
                            // stockQuantity: homrProvider.cartItems.values
                            //     .toList()[widget.index]
                            //     .stockQuantity,
                            // file: homrProvider.cartItems.values
                            //     .toList()[widget.index]
                            //     .file,
                          )));
            },
            child: Container(
              height: height * 0.2,
              color: Colors.grey.withOpacity(0.1),
              // margin: EdgeInsets.all(8),
              child: Row(
                children: [
                  Container(
                    width: width * 0.3,
                    height: height * 0.2,
                    child: widget.cartProduct.product.file != null
                        ? Image.file(
                            widget.cartProduct.product.file,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            widget.cartProduct.product.imageUrl,
                            fit: BoxFit.cover,
                          ),
                  ),
                  SizedBox(width: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: width * 0.5,
                          child: Text(
                            widget.cartProduct.product.title,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text('Price: ' +
                            '\$ ' +
                            widget.cartProduct.product.price.toString()),
                        SizedBox(height: 5),
                        Text(
                          'TotalProducrPrice: ' +
                              '\$ ' +
                              homeProvider
                                  .totalProductPrice(
                                      widget.cartProduct.product.price,
                                      widget.cartProduct.product.quantity)
                                  .toStringAsFixed(2),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
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
                                        if (widget
                                                .cartProduct.product.quantity >
                                            1)
                                          widget.cartProduct.product.quantity--;
                                      });
                                    }),
                                Text(
                                  widget.cartProduct.product.quantity
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
                                      print(
                                          widget.cartProduct.product.quantity);
                                      print(widget
                                          .cartProduct.product.stockQuantity);

                                      if (widget.cartProduct.product.quantity >
                                          widget.cartProduct.product
                                                  .stockQuantity -
                                              1) {
                                        return SharedWidget.showToastMsg(
                                            'Out of Stock ',
                                            time: 4);
                                      }
                                      setState(() {
                                        widget.cartProduct.product.quantity++;
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
    );
  }
}
