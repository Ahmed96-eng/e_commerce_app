import 'package:ecommerceapp/model/cart.dart';

class Order {
  String id;
  List<Cart> cartProducts;
  double amount;
  DateTime dateTime;

  Order({
    this.id,
    this.cartProducts,
    this.amount,
    this.dateTime,
  });
  Order.fromjson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['id'];
    this.cartProducts = jsonObject['cartProducts'];
    this.amount = jsonObject['amount'];
    this.dateTime = jsonObject['dateTime'];
  }
}
