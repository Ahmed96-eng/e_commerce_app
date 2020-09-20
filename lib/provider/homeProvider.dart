import 'package:ecommerceapp/model/cart.dart';
import 'package:ecommerceapp/model/favorite.dart';
import 'package:ecommerceapp/model/order.dart';
import 'package:ecommerceapp/model/product.dart';
import 'package:ecommerceapp/widget/shared_widget.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  List<Product> _snackersItems = [
    Product(
      id: '1',
      title: 'Snacker 1',
      description: 'Snacker 1 description',
      price: 25.99,
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/71oP3EMX4hL._UL1500_.jpg',
      quantity: 1,
    ),
    Product(
      id: '2',
      title: 'Snacker 2',
      description:
          'Snacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 description',
      price: 50.99,
      imageUrl:
          'https://5.imimg.com/data5/GU/LY/MY-44393694/men-sneaker-shoes-500x500.jpg',
      quantity: 1,
    ),
    Product(
      id: '3',
      title: 'Snacker 3',
      description: 'Snacker 3 description',
      price: 20.25,
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/71OCUKectKL._UX395_.jpg',
      quantity: 1,
    ),
    Product(
      id: '4',
      title: 'Snacker 4',
      description: 'Snacker 4 description',
      price: 30.99,
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/611TWd7sDIL._UY500_.jpg',
      quantity: 1,
    ),
  ];
  List<Product> _watchItems = [
    Product(
      id: '30',
      title: 'Watch 1',
      description: 'Watch 1 description',
      price: 25.99,
      imageUrl: 'https://www.amazon.in/images/I/61WixzlVuXL.jpg',
      quantity: 1,
    ),
    Product(
      id: '34',
      title: 'Watch 2',
      description:
          'Watch 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 description',
      price: 25.99,
      imageUrl:
          'https://www.ablogtowatch.com/wp-content/uploads/2019/09/eBay-Omega-2.jpeg',
      quantity: 1,
    ),
  ];
  List<Product> _jacketItems = [
    Product(
      id: '12',
      title: 'Jacket 1',
      description: 'Jacket 1 description',
      price: 25.99,
      imageUrl:
          'https://cdn-images.farfetch-contents.com/14/70/76/45/14707645_25035903_600.jpg',
      quantity: 1,
    ),
    Product(
      id: '41',
      title: 'Jacket 2',
      description:
          'Jacket 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 description',
      price: 25.99,
      imageUrl:
          'https://cf5.s3.souqcdn.com/item/2019/12/12/94/96/25/28/item_XL_94962528_f6d4794cb507c.jpg',
      quantity: 1,
    ),
  ];
  List<Product> _shirtItems = [
    Product(
      id: '15',
      title: 'Shirt 1',
      description: 'Shirt 1 description',
      price: 25.99,
      imageUrl:
          'https://lcw.akinoncdn.com/products/2020/03/10/1525250/354b1db1-b122-4130-8cea-2ee8d01d6eac_size561x730.jpg',
      quantity: 1,
    ),
    Product(
      id: '25',
      title: 'Shirt 2',
      description:
          'Shirt 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 description',
      price: 25.99,
      imageUrl:
          'https://lcw.akinoncdn.com/products/2020/02/26/1208380/b569b97a-1f1d-4a37-8045-b317066674fb_size561x730.jpg',
      quantity: 1,
    ),
  ];
  List<Product> get snackersItems => _snackersItems;
  List<Product> get watchItems => _watchItems;
  List<Product> get jacketItems => _jacketItems;
  List<Product> get shirtItems => _shirtItems;

  Map<String, Cart> _cartItems = {};
  Map<String, Cart> get cartItems => _cartItems;
  Map<String, Favorite> _favoriteItems = {};
  Map<String, Favorite> get favoriteItems => _favoriteItems;

  List<Order> _orders = [];
  List<Order> get orders => _orders;

  int get cartCount {
    return _cartItems.length;
  }

  int get favoriteCount {
    return _favoriteItems.length;
  }

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach(
      (key, cartItem) {
        total += cartItem.price * cartItem.quantity;
      },
    );
    return total;
  }

  void addCart(String productId, String title, double price, String imageUrl,
      String description, int quantity) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (existingCartItem) => Cart(
              id: existingCartItem.id,
              title: existingCartItem.title,
              imageUrl: existingCartItem.imageUrl,
              price: existingCartItem.price,
              description: existingCartItem.description,
              quantity: existingCartItem.quantity + quantity));
    } else {
      _cartItems.putIfAbsent(
        productId,
        () => Cart(
            id: DateTime.now().toString(),
            title: title,
            imageUrl: imageUrl,
            price: price,
            description: description,
            quantity: quantity),
      );
    }
    SharedWidget.showToastMsg('Add To Cart Success ', time: 4);
    notifyListeners();
  }

  void removeCartItem(String id) {
    cartItems.remove(id);
    notifyListeners();
  }

  void addFavorite(String productId, String title, String imageUrl,
      String description, double price) {
    if (_favoriteItems.containsKey(productId)) {
      _favoriteItems.update(
          productId,
          (existingFavoriteItem) => Favorite(
              id: existingFavoriteItem.id,
              title: existingFavoriteItem.title,
              imageUrl: existingFavoriteItem.imageUrl,
              description: existingFavoriteItem.description,
              price: existingFavoriteItem.price,
              quantity: existingFavoriteItem.quantity + 1));
    } else {
      _favoriteItems.putIfAbsent(
        productId,
        () => Favorite(
            id: productId,
            title: title,
            imageUrl: imageUrl,
            description: description,
            price: price,
            quantity: 1),
      );
    }
    SharedWidget.showToastMsg('Add To Favorite Success ', time: 4);
    notifyListeners();
  }

  void removeFavorite(String productId) {
    if (!_favoriteItems.containsKey(productId)) {
      return;
    }
    if (_favoriteItems[productId].quantity > 1) {
      _favoriteItems.update(
        productId,
        (existingFavoriteItem) => Favorite(
          id: existingFavoriteItem.id,
          title: existingFavoriteItem.title,
          price: existingFavoriteItem.price,
          imageUrl: existingFavoriteItem.imageUrl,
          description: existingFavoriteItem.description,
          quantity: existingFavoriteItem.quantity - 1,
        ),
      );
    } else {
      _favoriteItems.remove(productId);
    }
    SharedWidget.showToastMsg('Delete From Favorite Success ', time: 4);
    notifyListeners();
  }

  // void togelFavorite(bool _isFavorite) {
  //   _isFavorite = !_isFavorite;
  //   notifyListeners();
  // }

  double totalProductPrice(double price, int quantity) {
    return price * quantity;
  }

  void addOrder(List<Cart> orderPrducts, double total) {
    _orders.insert(
      0,
      Order(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        amount: total,
        cartProducts: orderPrducts,
        dateTime: DateTime.now(),
      ),
    );
    SharedWidget.showToastMsg('Add  Order Success ', time: 4);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
