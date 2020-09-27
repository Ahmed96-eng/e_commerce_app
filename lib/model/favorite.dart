import 'package:ecommerceapp/model/product.dart';

class Favorite {
  // String id;
  // String title;
  // String imageUrl;
  // double price;
  // String description;
  // int quantity;
  // bool isFavorite;
  Product product;
  Favorite({
    // this.id,
    // this.title,
    // this.imageUrl,
    // this.price,
    // this.description,
    // this.quantity,
    // this.isFavorite = false,
    this.product,
  });

  // Favorite.fromjson(Map<String, dynamic> jsonObject) {
  //   this.id = jsonObject['id'];
  //   this.title = jsonObject['title'];
  //   this.imageUrl = jsonObject['imageUrl'];
  //   this.price = jsonObject['price'];
  //   this.description = jsonObject['description'];
  //   this.quantity = jsonObject['quantity'];
  //   this.isFavorite = jsonObject['isFavorite'];
  // }
}
