import 'package:ecommerceapp/model/favorite.dart';
import 'package:ecommerceapp/model/product.dart';
import 'package:ecommerceapp/provider/homeProvider.dart';
import 'package:ecommerceapp/screens/productDetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteItem extends StatelessWidget {
  Favorite favoriteProduct;
  FavoriteItem({this.favoriteProduct});
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
            // print('ONTAPPED ${product.description.toString()}+2@');
            // print('ONTAPPED ${product.title.toString()}+2@');
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetails(
                          // id: favoriteProduct.product.id.toString(),
                          // title: favoriteProduct.product.title,
                          // imageUrl: favoriteProduct.product.imageUrl,
                          // description:
                          //     favoriteProduct.product.description ?? "",
                          // price: favoriteProduct.product.price,
                          // quantity: favoriteProduct.product.quantity,
                          // stockQuantity: favoriteProduct.product.stockQuantity,
                          // isFavorite: favoriteProduct.product.isFavorite,
                          // file: favoriteProduct.product.file,
                          product: favoriteProduct.product,
                        )));
          },
          child: Container(
            height: height * 0.15,
            color: Colors.grey.withOpacity(0.1),
            // margin: EdgeInsets.all(8),
            child: Row(
              children: [
                Container(
                  width: width * 0.3,
                  height: height * 0.2,
                  child: favoriteProduct.product.file != null
                      ? Image.file(
                          favoriteProduct.product.file,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          favoriteProduct.product.imageUrl,
                          fit: BoxFit.cover,
                        ),
                ),
                SizedBox(width: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width * 0.45,
                        child: Text(
                          favoriteProduct.product.title,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "\$ ${favoriteProduct.product.price.toString()}",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Consumer<HomeProvider>(
                    builder: (context, homeProvider, child) => IconButton(
                        icon: Icon(
                          Icons.delete,
                          size: 35,
                        ),
                        onPressed: () {
                          homeProvider.removeFavorite(favoriteProduct.product);
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
