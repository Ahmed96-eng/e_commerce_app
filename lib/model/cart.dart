class Cart {
  String id;
  String title;
  String imageUrl;
  double price;
  String description;
  int quantity;

  Cart({
    this.id,
    this.title,
    this.imageUrl,
    this.price,
    this.description,
    this.quantity,
  });

  Cart.fromjson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['id'];
    this.title = jsonObject['title'];
    this.title = jsonObject['imageUrl'];
    this.price = jsonObject['price'];
    this.description = jsonObject['description'];
    this.quantity = jsonObject['quantity'];
  }
}
