import 'package:ecommerceapp/model/product.dart';
import 'package:ecommerceapp/provider/favoriteProvider.dart';
import 'package:ecommerceapp/provider/homeProvider.dart';
import 'package:ecommerceapp/screens/productDetails.dart';
import 'package:ecommerceapp/widget/shared_storage.dart';
import 'package:ecommerceapp/widget/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatefulWidget {
  // String title, imagUrl, id, description;
  // double price;
  // int quantity;
  // bool isFavorite = false;
  // ProductItem({
  //   this.id,
  //   this.title,
  //   this.description,
  //   this.imagUrl,
  //   this.price,
  //   this.quantity,
  //   this.isFavorite,
  // });
  int index;
  Product product;
  ProductItem({this.product, this.index});
  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  // final LocalStorage storageFavorite = LocalStorage('favorite');
  bool _isFavorite = false;
  @override
  void initState() {
    super.initState();
    SharedStorage().getcheckFavoritePref(widget.product.id);
  }

  @override
  Widget build(BuildContext context) {
    // bool _isFavorite = widget.isFavorite;
    final homeProvider = Provider.of<HomeProvider>(context);
    print('Product item widgit ----------');
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Card(
            child: Container(
              width: 300,
              height: 300,
              child: GridTile(
                header: ListTile(
                  leading: IconButton(
                      icon: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: _isFavorite ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                          if (_isFavorite) {
                            homeProvider.addFavorite(
                              widget.product.id,
                              widget.product.title,
                              widget.product.imageUrl,
                              widget.product.description,
                              widget.product.price,
                              widget.product.isFavorite,
                              widget.product.quantity,
                            );
                            // homeProvider.changeFavoriteValue(true);
                            SharedStorage().setCheckFavoritePref(
                                widget.product.id, _isFavorite);
                          } else {
                            homeProvider.removeFavorite(widget.product.id);
                            // homeProvider.changeFavoriteValue(false);
                            SharedStorage().setCheckFavoritePref(
                                widget.product.id, _isFavorite);
                          }
                        });
                      }),

                  // IconButton(
                  //     icon: Icon(
                  //       favoriteProvider.getFavorite
                  //           ? Icons.favorite
                  //           : Icons.favorite_border,
                  //       color: Colors.red,
                  //     ),
                  //     onPressed: () {
                  //       // setState(() {
                  //       favoriteProvider.changeFavoriteValue(true);
                  //       if (_isFavorite) {
                  //         homeProvider.addFavorite(
                  //             widget.id,
                  //             widget.title,
                  //             widget.imagUrl,
                  //             widget.description,
                  //             widget.price);
                  //         SharedStorage()
                  //             .setCheckFavoritePref(widget.id, true);
                  //       } else {
                  //         favoriteProvider.changeFavoriteValue(false);
                  //         homeProvider.removeFavorite(widget.id);
                  //         SharedStorage()
                  //             .setCheckFavoritePref(widget.id, false);
                  //       }
                  //       // });
                  //     }),
                  // ),
                  trailing: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.redAccent.withOpacity(0.4),
                    ),
                    child: Text("x ${widget.product.quantity.toString()}"),
                  ),
                ),
                child: Image.network(
                  widget.product.imageUrl,
                  fit: BoxFit.cover,
                ),
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
