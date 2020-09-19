class Favorite {
  String id;
  String title;
  String imageUrl;
  String description;
  double price;
  int quantity;

  Favorite({
    this.id,
    this.title,
    this.imageUrl,
    this.description,
    this.price,
    this.quantity,
  });

  Favorite.fromjson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['id'];
    this.title = jsonObject['title'];
    this.imageUrl = jsonObject['imageUrl'];
    this.description = jsonObject['description'];
    this.price = jsonObject['price'];
    this.quantity = jsonObject['quantity'];
  }
}
