import 'package:ecommerceapp/screens/productDetails.dart';
import 'package:flutter/material.dart';

class FavoriteItem extends StatelessWidget {
  String title, imageUrl, id, description;
  double price;
  int quantity;

  FavoriteItem({
    this.id,
    this.title,
    this.imageUrl,
    this.price,
    this.description,
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "\$ ${price.toString()}",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
