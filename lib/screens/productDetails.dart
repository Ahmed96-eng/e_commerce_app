import 'package:ecommerceapp/provider/homeProvider.dart';
import 'package:ecommerceapp/widget/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  String title, imagUrl, id, description;
  double price;
  int quantity;
  ProductDetails(
      {this.id,
      this.title,
      this.description,
      this.imagUrl,
      this.price,
      this.quantity});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
              background: Image.network(
                widget.imagUrl ?? "",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            ListTile(
              title: Text(
                widget.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              // trailing: Text(
              //   "\$ ${widget.price}",
              //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              // ),
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
                              if (widget.quantity > 1) widget.quantity--;
                            });
                          }),
                      Text(
                        widget.quantity.toString(),
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
                            setState(() {
                              widget.quantity++;
                            });
                          }),
                    ],
                  ),
                ),
              ),
              trailing: Text(
                "\$ ${widget.price}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: RaisedButton.icon(
                  icon: Icon(Icons.shopping_cart),
                  label: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text('Add To Cart'),
                  ),
                  onPressed: () {
                    homeProvider.addCart(widget.id, widget.title, widget.price,
                        widget.imagUrl, widget.quantity);
                  },
                  color: Colors.redAccent.withOpacity(0.4),
                  highlightColor: Colors.red.withOpacity(0.4),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Description',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                widget.description,
                softWrap: true,
                overflow: TextOverflow.fade,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: height,
              // color: Colors.amberAccent,
            ),
          ])),
        ],
      ),

      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),

      // body: Column(
      //   children: [
      // Container(
      //   // width: 250,
      //   height: 250,
      //   child: Image.network(
      //     widget.imagUrl,
      //     fit: BoxFit.cover,
      //   ),
      // ),
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Card(
      //       child: ListTile(
      //     title: Text(widget.title),
      //   )),
      // ),
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Card(
      //       child: ListTile(
      //     title: Text(widget.price.toString()),
      //   )),
      // ),
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Card(
      //       child: ListTile(
      //     title: Text(widget.description),
      //   )),
      // ),
      //   ],
      // ),
    );
  }
}
