import 'package:ecommerceapp/provider/homeProvider.dart';
import 'package:ecommerceapp/screens/productDetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteItem extends StatelessWidget {
  String id;
  String productKey;
  String title;
  String imageUrl;
  String description;
  double price;
  int quantity;

  FavoriteItem({
    this.id,
    this.productKey,
    this.title,
    this.imageUrl,
    this.description,
    this.price,
    this.quantity,
  });
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: () {
            print('ONTAPPED ${description.toString()}+2@');
            print('ONTAPPED ${title.toString()}+2@');
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetails(
                          id: id.toString(),
                          title: title,
                          imagUrl: imageUrl,
                          description: description ?? "",
                          price: price,
                          quantity: quantity,
                        )));
          },
          child: Container(
            height: height * 0.15,
            color: Colors.red[50],
            // margin: EdgeInsets.all(8),
            child: Row(
              children: [
                Container(
                  width: width * 0.3,
                  height: height * 0.2,
                  child: Image.network(
                    imageUrl,
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
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "\$ ${price.toString()}",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                // Consumer<HomeProvider>(
                //     builder: (context, homeProvider, child) => IconButton(
                //         icon: Icon(Icons.delete),
                //         onPressed: () {
                //           homeProvider.removeFavorite(id, false);
                //         })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
