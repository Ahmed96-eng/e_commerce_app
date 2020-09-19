class Cart {
  String id;
  String title;
  String imageUrl;
  double price;
  int quantity;

  Cart({
    this.id,
    this.title,
    this.imageUrl,
    this.price,
    this.quantity,
  });

  Cart.fromjson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['id'];
    this.title = jsonObject['title'];
    this.title = jsonObject['imageUrl'];
    this.price = jsonObject['price'];
    this.quantity = jsonObject['quantity'];
  }
}
