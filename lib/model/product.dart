class Product {
  String id;
  String title;
  String imageUrl;
  String description;
  double price;
  int quantity;

  Product({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.price,
    this.quantity,
  });

  Product.fromjson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['id'];
    this.title = jsonObject['title'];
    this.description = jsonObject['description'];
    this.price = jsonObject['price'];
    this.quantity = jsonObject['quantity'];
    this.imageUrl = jsonObject['imageUrl'];
  }
}
