import 'dart:io';

class Product {
  String id;
  String title;
  String imageUrl;
  String description;
  double price;
  int quantity;
  bool isFavorite;
  String category;
  File file;

  Product({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.price,
    this.quantity,
    this.isFavorite = false,
    this.category,
    this.file,
  });

  Product.fromjson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['id'];
    this.title = jsonObject['title'];
    this.description = jsonObject['description'];
    this.price = jsonObject['price'];
    this.quantity = jsonObject['quantity'];
    this.imageUrl = jsonObject['imageUrl'];
    this.isFavorite = jsonObject['isFavorite'];
  }
}
