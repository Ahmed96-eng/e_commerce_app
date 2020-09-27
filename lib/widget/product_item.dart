import 'package:ecommerceapp/model/favorite.dart';
import 'package:ecommerceapp/model/product.dart';

import 'package:ecommerceapp/provider/homeProvider.dart';
import 'package:ecommerceapp/screens/productDetails.dart';
import 'package:ecommerceapp/widget/shared_storage.dart';
import 'package:ecommerceapp/widget/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatefulWidget {
  Product product;
  ProductItem({this.product});
  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  void initState() {
    super.initState();
    // SharedStorage().getcheckFavoritePref(widget.product.id);
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Card(
            child: Container(
              width: 300,
              height: 300,
              child: GridTile(
                header: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.06,
                      backgroundColor: Colors.redAccent.withOpacity(0.3),
                      child: IconButton(
                          icon: Icon(
                            widget.product.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: widget.product.isFavorite
                                ? Colors.red[500]
                                : Colors.black,
                            size: 26,
                          ),
                          onPressed: () {
                            setState(() {
                              widget.product.isFavorite =
                                  !widget.product.isFavorite;
                              if (widget.product.isFavorite) {
                                homeProvider.addFavorite(
                                  widget.product,
                                );

                                // SharedStorage().setCheckFavoritePref(
                                //     widget.product.id,
                                //     widget.product.isFavorite);
                              } else {
                                homeProvider.removeFavorite(
                                  widget.product,
                                );

                                // SharedStorage().setCheckFavoritePref(
                                //     widget.product.id,
                                //     widget.product.isFavorite);
                              }
                            });
                          }),
                    ),
                    trailing: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.06,
                      backgroundColor: Colors.redAccent.withOpacity(0.3),
                      child: Text(
                        "x ${widget.product.quantity.toString()}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                child: Image.network(
                      widget.product.imageUrl,
                      fit: BoxFit.cover,
                    ) ??
                    Image.file(
                      widget.product.file,
                      fit: BoxFit.cover,
                    ) ??
                    '',
                footer: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.redAccent.withOpacity(0.4),
                  ),
                  child: ListTile(
                    title: Text(
                      widget.product.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text(
                      widget.product.price.toString(),
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
