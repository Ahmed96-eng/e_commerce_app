import 'package:ecommerceapp/model/product.dart';

class Category {
  String id;
  String title;
  String imageUrl;
  List<Product> products;

  Category({
    this.id,
    this.title,
    this.imageUrl,
    this.products,
  });
}
