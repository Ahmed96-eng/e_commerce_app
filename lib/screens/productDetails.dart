import 'package:ecommerceapp/model/product.dart';
import 'package:ecommerceapp/provider/homeProvider.dart';
import 'package:ecommerceapp/screens/cart_screen.dart';
import 'package:ecommerceapp/screens/favorite_screen.dart';
import 'package:ecommerceapp/widget/appBar_widget.dart';
import 'package:ecommerceapp/widget/badge.dart';
import 'package:ecommerceapp/widget/bottom_bar_widget.dart';
import 'package:ecommerceapp/widget/shared_storage.dart';
import 'package:ecommerceapp/widget/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  // String title, imagUrl, id, description;
  // double price;
  // int quantity;
  // bool isFavorite;
  // ProductDetails(
  //     {this.id,
  //     this.title,
  //     this.description,
  //     this.imagUrl,
  //     this.price,
  //     this.quantity,
  //     this.isFavorite = false});

  Product product;
  ProductDetails({this.product});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int fixedQuantity = 1;
  // @override
  // void initState() {
  //   SharedStorage().getcheckFavoritePref(widget.id);

  //   super.initState();
  // }
// this.props.navigation.state.params.refresh();
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            snap: false, stretch: true,
            floating: true,
            excludeHeaderSemantics: true,
            automaticallyImplyLeading: true,
            backgroundColor: Colors.redAccent.withOpacity(0.4),
            // title: Text(widget.title,
            //     style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: height * 0.045,
            //         color: Colors.black87)),
            pinned: true,
            expandedHeight: height * 0.5,
            flexibleSpace: FlexibleSpaceBar(
              background: widget.product.file != null
                  ? Image.file(
                      widget.product.file,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      widget.product.imageUrl,
                      fit: BoxFit.cover,
                    ),
              // Image.network(
              //   widget.product.imageUrl ?? "",
              //   fit: BoxFit.cover,
              // ),
            ),
            actions: [
              Badge(
                child: IconButton(
                  icon: Icon(
                    Icons.favorite,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(FavoriteScreen.route);
                  },
                ),
                value: homeProvider.favoriteCount.toString(),
              ),
              Badge(
                child: IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.route);
                  },
                ),
                value: homeProvider.cartCount.toString(),
              ),
            ],
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Expanded(
              child: ListTile(
                title: Text(
                  widget.product.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    width: width * 0.12,
                    height: height * 0.12,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.withOpacity(0.6),
                        border: Border.all(
                            color: Colors.redAccent.withOpacity(0.4))),
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
                ),
              ),
            ),
            ListTile(
              title: Consumer<HomeProvider>(
                builder: (context, homeProvider, child) => Expanded(
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
                              if (widget.product.quantity > 1)
                                widget.product.quantity--;
                            });
                          }),
                      Text(
                        // widget.product.quantity > 1
                        //     ? fixedQuantity.toString()
                        //     :
                        widget.product.quantity.toString(),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.add_circle,
                            size: 30,
                          ),
                          onPressed: () {
                            print(widget.product.quantity);
                            print(widget.product.stockQuantity);
                            if (widget.product.quantity >
                                widget.product.stockQuantity - 1) {
                              return SharedWidget.showToastMsg('Out of Stock ',
                                  time: 4);
                            }
                            setState(() {
                              widget.product.quantity++;
                            });
                          }),
                    ],
                  ),
                ),
              ),
              trailing: Text(
                "\$ ${widget.product.price}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: widget.product.quantity >= 0
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.withOpacity(0.6),
                          border: Border.all(
                              color: Colors.redAccent.withOpacity(0.4)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: RaisedButton.icon(
                            icon: Icon(Icons.shopping_cart),
                            label: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                'Add To Cart',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            onPressed: () {
                              homeProvider.addCart(
                                widget.product,
                                // widget.product.id,
                                // widget.product.title,
                                // widget.product.price,
                                // widget.product.imageUrl,
                                // widget.product.description,
                                // widget.product.quantity,
                              );
                            },
                            // color: Colors.grey.withOpacity(0.6),
                            // highlightColor: Colors.black.withOpacity(0.4),
                          ),
                        ),
                      )
                    : Container(),
              ),
            ),
            ListTile(
              title: Text(
                'Description',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                widget.product.description,
                softWrap: true,
                overflow: TextOverflow.fade,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: height - 350,
              // color: Colors.amberAccent,
            ),
          ])),
        ],
      ),
      // bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
