import 'package:ecommerceapp/model/product.dart';
import 'package:ecommerceapp/provider/homeProvider.dart';
import 'package:ecommerceapp/screens/productDetails.dart';
import 'package:ecommerceapp/widget/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatefulWidget {
  String title, imagUrl, id, description;
  double price;
  int quantity;
  ProductItem(
      {this.id,
      this.title,
      this.description,
      this.imagUrl,
      this.price,
      this.quantity});
  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Card(
            child: Container(
              width: 300,
              height: 300,
              child: GridTile(
                header: ListTile(
                  leading: Consumer<HomeProvider>(
                    builder: (context, homeProvider, child) => IconButton(
                        icon: Icon(
                          _isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            _isFavorite = !_isFavorite;

                            if (_isFavorite) {
                              homeProvider.addFavorite(
                                  widget.id,
                                  widget.title,
                                  widget.imagUrl,
                                  widget.description,
                                  widget.price);
                            } else {
                              homeProvider.removeFavorite(widget.id);
                            }
                          });
                        }),
                  ),
                  trailing: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.redAccent.withOpacity(0.4),
                    ),
                    child: Text("x ${widget.quantity.toString()}"),
                  ),
                ),
                child: Image.network(
                  widget.imagUrl,
                  fit: BoxFit.cover,
                ),
                footer: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.redAccent.withOpacity(0.4),
                  ),
                  child: ListTile(
                    title: Text(
                      widget.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text(
                      widget.price.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black54),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
