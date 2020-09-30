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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Card(
        child: Container(
          width: width,
          height: height * 0.5,
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(20),
            color: Colors.grey.withOpacity(0.6),
            border: Border.all(
              color: Colors.redAccent.withOpacity(0.4),
            ),
          ),
          child: GridTile(
            header: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListTile(
                leading: Container(
                  width: width * 0.14,
                  height: height * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.withOpacity(0.6),
                      border:
                          Border.all(color: Colors.redAccent.withOpacity(0.4))),
                  child: Center(
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
                ),
                trailing: Container(
                  width: width * 0.14,
                  height: height * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.withOpacity(0.6),
                      border:
                          Border.all(color: Colors.redAccent.withOpacity(0.4))),
                  child: Center(
                    child: Text(
                      "x ${widget.product.stockQuantity.toString()}",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            child: widget.product.file != null
                ? Image.file(
                    widget.product.file,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    widget.product.imageUrl,
                    fit: BoxFit.cover,
                  ),

            //  Container(
            //     width: MediaQuery.of(context).size.width,
            //     height: 100,
            //     decoration: BoxDecoration(
            //         image: DecorationImage(
            //             image: NetworkImage(
            //               widget.product.imageUrl,
            //             ),
            //             fit: BoxFit.cover))),
            footer: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.6),
              ),
              child: ListTile(
                title: Text(
                  widget.product.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Text(
                  "Price : ${widget.product.price.toString()} \$",
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
    );
  }
}
