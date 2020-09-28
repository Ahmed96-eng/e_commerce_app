import 'dart:convert';
import 'dart:io';

import 'package:ecommerceapp/model/cart.dart';
import 'package:ecommerceapp/model/category.dart';
import 'package:ecommerceapp/model/favorite.dart';
import 'package:ecommerceapp/model/order.dart';
import 'package:ecommerceapp/model/product.dart';
import 'package:ecommerceapp/widget/shared_widget.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  // List<Category> _category = [
  //   Category(
  //     id: '5',
  //     title: 'new',
  //     imageUrl: 'https://www.amazon.in/images/I/61WixzlVuXL.jpg',
  //     products: _products,
  //   ),

  //   Category(
  //     id: '1',
  //     title: 'Snackers',
  //     imageUrl:
  //         'https://images-na.ssl-images-amazon.com/images/I/611TWd7sDIL._UY500_.jpg',
  //     products: [
  //       // Product(
  //       //   id: '1',
  //       //   title: 'Snacker 1',
  //       //   description: 'Snacker 1 description',
  //       //   price: 25.99,
  //       //   imageUrl:
  //       //       'https://images-na.ssl-images-amazon.com/images/I/611TWd7sDIL._UY500_.jpg',
  //       //   quantity: 1,
  //       //   isFavorite: false,
  //       //   category: 'snacker',
  //       // ),
  //       // Product(
  //       //   id: '2',
  //       //   title: 'Snacker 2',
  //       //   description:
  //       //       'Snacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 description',
  //       //   price: 50.99,
  //       //   imageUrl:
  //       //       'https://5.imimg.com/data5/GU/LY/MY-44393694/men-sneaker-shoes-500x500.jpg',
  //       //   quantity: 1,
  //       //   isFavorite: false,
  //       //   category: 'snacker',
  //       // ),
  //       // Product(
  //       //   id: '3',
  //       //   title: 'Snacker 3',
  //       //   description: 'Snacker 3 description',
  //       //   price: 20.25,
  //       //   imageUrl:
  //       //       'https://images-na.ssl-images-amazon.com/images/I/71OCUKectKL._UX395_.jpg',
  //       //   quantity: 1,
  //       //   isFavorite: false,
  //       //   category: 'snacker',
  //       // ),
  //       // Product(
  //       //   id: '4',
  //       //   title: 'Snacker 4',
  //       //   description: 'Snacker 4 description',
  //       //   price: 30.99,
  //       //   imageUrl:
  //       //       'https://images-na.ssl-images-amazon.com/images/I/71oP3EMX4hL._UL1500_.jpg',
  //       //   quantity: 1,
  //       //   isFavorite: false,
  //       //   category: 'snacker',
  //       // ),
  //     ],
  //   ),
  //   Category(
  //     id: '2',
  //     title: 'Watch',
  //     imageUrl: 'https://www.amazon.in/images/I/61WixzlVuXL.jpg',
  //     products: [
  //       // Product(
  //       //   id: '30',
  //       //   title: 'Watch 1',
  //       //   description: 'Watch 1 description',
  //       //   price: 25.99,
  //       //   imageUrl: 'https://www.amazon.in/images/I/61WixzlVuXL.jpg',
  //       //   quantity: 1,
  //       //   isFavorite: false,
  //       //   category: 'watch',
  //       // ),
  //       // Product(
  //       //   id: '34',
  //       //   title: 'Watch 2',
  //       //   description:
  //       //       'Watch 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 description',
  //       //   price: 25.99,
  //       //   imageUrl:
  //       //       'https://www.ablogtowatch.com/wp-content/uploads/2019/09/eBay-Omega-2.jpeg',
  //       //   quantity: 1,
  //       //   isFavorite: false,
  //       //   category: 'watch',
  //       // ),
  //     ],
  //   ),
  //   Category(
  //     id: '3',
  //     title: 'Jacket',
  //     imageUrl:
  //         'https://cdn-images.farfetch-contents.com/14/70/76/45/14707645_25035903_600.jpg',
  //     products: [
  //       // Product(
  //       //   id: '12',
  //       //   title: 'Jacket 1',
  //       //   description: 'Jacket 1 description',
  //       //   price: 25.99,
  //       //   imageUrl:
  //       //       'https://cdn-images.farfetch-contents.com/14/70/76/45/14707645_25035903_600.jpg',
  //       //   quantity: 1,
  //       //   isFavorite: false,
  //       //   category: 'jacket',
  //       // ),
  //       // Product(
  //       //   id: '41',
  //       //   title: 'Jacket 2',
  //       //   description:
  //       //       'Jacket 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 description',
  //       //   price: 25.99,
  //       //   imageUrl:
  //       //       'https://cf5.s3.souqcdn.com/item/2019/12/12/94/96/25/28/item_XL_94962528_f6d4794cb507c.jpg',
  //       //   quantity: 1,
  //       //   isFavorite: false,
  //       //   category: 'jacket',
  //       // ),
  //     ],
  //   ),
  //   Category(
  //     id: '4',
  //     title: 'Shirt',
  //     imageUrl:
  //         'https://lcw.akinoncdn.com/products/2020/03/10/1525250/354b1db1-b122-4130-8cea-2ee8d01d6eac_size561x730.jpg',
  //     products: [
  //       // Product(
  //       //   id: '15',
  //       //   title: 'Shirt 1',
  //       //   description: 'Shirt 1 description',
  //       //   price: 25.99,
  //       //   imageUrl:
  //       //       'https://lcw.akinoncdn.com/products/2020/03/10/1525250/354b1db1-b122-4130-8cea-2ee8d01d6eac_size561x730.jpg',
  //       //   quantity: 1,
  //       //   isFavorite: false,
  //       //   category: 'shirt',
  //       // ),
  //       // Product(
  //       //   id: '25',
  //       //   title: 'Shirt 2',
  //       //   description:
  //       //       'Shirt 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 descriptionSnacker 2 description',
  //       //   price: 25.99,
  //       //   imageUrl:
  //       //       'https://lcw.akinoncdn.com/products/2020/02/26/1208380/b569b97a-1f1d-4a37-8045-b317066674fb_size561x730.jpg',
  //       //   quantity: 1,
  //       //   isFavorite: false,
  //       //   category: 'shirt',
  //       // ),
  //     ],
  //   ),
  // ];

  // List<Category> get category => _category;

  List<Product> _products = [
    Product(
      id: '1',
      title: 'Snacker 1',
      description: 'Snacker 1 description',
      price: 25.99,
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/611TWd7sDIL._UY500_.jpg',
      quantity: 1,
      isFavorite: false,
      category: 'snacker',
      file: null,
      imageCategory:
          'https://images-na.ssl-images-amazon.com/images/I/71oP3EMX4hL._UL1500_.jpg',
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
      isFavorite: false,
      category: 'snacker',
      file: null,
      imageCategory:
          'https://images-na.ssl-images-amazon.com/images/I/71oP3EMX4hL._UL1500_.jpg',
    ),
    Product(
      id: '3',
      title: 'Snacker 3',
      description: 'Snacker 3 description',
      price: 20.25,
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/71OCUKectKL._UX395_.jpg',
      quantity: 1,
      isFavorite: false,
      category: 'snacker',
      file: null,
      imageCategory:
          'https://images-na.ssl-images-amazon.com/images/I/71oP3EMX4hL._UL1500_.jpg',
    ),
    Product(
      id: '4',
      title: 'Snacker 4',
      description: 'Snacker 4 description',
      price: 30.99,
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/71oP3EMX4hL._UL1500_.jpg',
      quantity: 1,
      isFavorite: false,
      category: 'snacker',
      file: null,
      imageCategory:
          'https://images-na.ssl-images-amazon.com/images/I/71oP3EMX4hL._UL1500_.jpg',
    ),
    Product(
      id: '15',
      title: 'Shirt 1',
      description: 'Shirt 1 description',
      price: 25.99,
      imageUrl:
          'https://lcw.akinoncdn.com/products/2020/03/10/1525250/354b1db1-b122-4130-8cea-2ee8d01d6eac_size561x730.jpg',
      quantity: 1,
      isFavorite: false,
      category: 'shirt',
      file: null,
      imageCategory:
          'https://lcw.akinoncdn.com/products/2020/03/10/1525250/354b1db1-b122-4130-8cea-2ee8d01d6eac_size561x730.jpg',
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
      isFavorite: false,
      category: 'shirt',
      file: null,
      imageCategory:
          'https://lcw.akinoncdn.com/products/2020/03/10/1525250/354b1db1-b122-4130-8cea-2ee8d01d6eac_size561x730.jpg',
    ),
    Product(
      id: '12',
      title: 'Jacket 1',
      description: 'Jacket 1 description',
      price: 25.99,
      imageUrl:
          'https://cdn-images.farfetch-contents.com/14/70/76/45/14707645_25035903_600.jpg',
      quantity: 1,
      isFavorite: false,
      category: 'jacket',
      file: null,
      imageCategory:
          'https://cdn-images.farfetch-contents.com/14/70/76/45/14707645_25035903_600.jpg',
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
      isFavorite: false,
      category: 'jacket',
      file: null,
      imageCategory:
          'https://cdn-images.farfetch-contents.com/14/70/76/45/14707645_25035903_600.jpg',
    ),
    Product(
      id: '30',
      title: 'Watch 1',
      description: 'Watch 1 description',
      price: 25.99,
      imageUrl: 'https://www.amazon.in/images/I/61WixzlVuXL.jpg',
      quantity: 1,
      isFavorite: false,
      category: 'watch',
      file: null,
      imageCategory: 'https://www.amazon.in/images/I/61WixzlVuXL.jpg',
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
      isFavorite: false,
      category: 'watch',
      file: null,
      imageCategory: 'https://www.amazon.in/images/I/61WixzlVuXL.jpg',
    ),
  ];
  List<Product> get products => _products;

  Map<String, Cart> _cartItems = {};
  Map<String, Cart> get cartItems => _cartItems;

  Map<String, Favorite> _favoriteItems = {};
  Map<String, Favorite> get favoriteItems => _favoriteItems;

  List<Order> _orders = [];
  List<Order> get orders => _orders;

  void addProduct1({
    String title,
    String description,
    String category,
    String image,
    File file,
    int quantity,
    double price,
  }) {
    try {
      // String base64Image =
      //     "data:image/png;base64," + base64.encode(file.readAsBytesSync());
      // print("mmmxxxxxxxcccccccccvvvvvvvvvvvvm" + base64Image);
      // Category newProduct = Category(products: [
      Product newProduct = Product(
        id: DateTime.now().toString(),
        title: title,
        // imageUrl: base64Image ?? "",
        imageUrl: image ?? "",
        description: description,
        price: price,
        quantity: quantity,

        category: category,
        file: file,
      );
      // ]);
      _products.add(newProduct);

      SharedWidget.showToastMsg('Add Product Success ', time: 4);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  String imageCategory(String category) {
    return _products
        .firstWhere((element) => element.category == category)
        .imageCategory;
  }

  List<Product> productCategory(String category) {
    return _products.where((element) => element.category == category).toList();
  }

  List<String> get categories {
    List<String> _categories = [];
    for (int i = 0; i < _products.length; i++) {
      _categories.add(_products[i].category);
    }
    for (int i = 0; i < _categories.length; i++) {
      var category = _categories[i];
      for (int j = i + 1; j < _categories.length; j++) {
        if (_categories[j] == category) {
          _categories.removeAt(j);
          j--;
        }
      }
    }
    return _categories.toList();
  }

  List<String> get imageCategories {
    List<String> _imageCategories = [];
    for (int i = 0; i < _products.length; i++) {
      _imageCategories.add(_products[i].imageCategory);
    }
    for (int i = 0; i < _imageCategories.length; i++) {
      var image = _imageCategories[i];
      for (int j = i + 1; j < _imageCategories.length; j++) {
        if (_imageCategories[j] == image) {
          _imageCategories.removeAt(j);
          j--;
        }
      }
    }
    return _imageCategories.toList();
  }

  void updataProduct(String id, Product editProduct) {
    final prodIndex = _products.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _products[prodIndex] = editProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    _products.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }

  int get cartCount {
    return _cartItems.length;
  }

  int get favoriteCount {
    return _favoriteItems.length;
  }

  void addCart(
      // String productId, String title, double price, String imageUrl,
      //   String description, int quantity
      Product products) {
    if (_cartItems.containsKey(products.id)) {
      _cartItems.update(
          products.id,
          (existingCartItem) => Cart(
              // id: existingCartItem.id,
              // title: existingCartItem.title,
              // imageUrl: existingCartItem.imageUrl,
              // price: existingCartItem.price,
              // description: existingCartItem.description,
              // quantity: existingCartItem.quantity + quantity,
              product: existingCartItem.product));
    } else {
      _cartItems.putIfAbsent(
        products.id,
        () => Cart(
          // id: DateTime.now().toString(),
          // title: title,
          // imageUrl: imageUrl,
          // price: price,
          // description: description,
          // quantity: quantity,
          product: products,
        ),
      );
    }

    SharedWidget.showToastMsg('Add To Cart Success ', time: 4);
    notifyListeners();
    products.quantity = 1;
  }

  void removeCartItem(String id) {
    cartItems.remove(id);
    SharedWidget.showToastMsg('Delete from Cart Success ', time: 4);
    notifyListeners();
  }

  void addFavorite(
      // String productId, String title, String imageUrl,
      //   String description, double price, bool isFavorite, int quantity,
      Product products) {
    if (_favoriteItems.containsKey(products.id)) {
      _favoriteItems.update(
        products.id,
        (existingFavoriteItem) => Favorite(
          // id: existingFavoriteItem.id,
          // title: existingFavoriteItem.title,
          // imageUrl: existingFavoriteItem.imageUrl,
          // description: existingFavoriteItem.description,
          // price: existingFavoriteItem.price,
          // quantity: existingFavoriteItem.quantity + 1,
          // isFavorite: existingFavoriteItem.isFavorite),
          product: existingFavoriteItem.product,
        ),
      );
    } else {
      _favoriteItems.putIfAbsent(
        products.id,
        () => Favorite(
          // id: productId,
          // title: title,
          // imageUrl: imageUrl,
          // description: description,
          // price: price,
          // quantity: 1,
          // isFavorite: isFavorite,
          product: products,
        ),
      );
    }
    // isFavorite = true;
    SharedWidget.showToastMsg('Add To Favorite Success ', time: 4);
    notifyListeners();
  }

  void removeFavorite(Product products) {
    if (!_favoriteItems.containsKey(products.id)) {
      return;
    }
    if (_favoriteItems[products.id].product.quantity > 1) {
      _favoriteItems.update(
        products.id,
        (existingFavoriteItem) => Favorite(
          // id: existingFavoriteItem.id,
          // title: existingFavoriteItem.title,
          // price: existingFavoriteItem.price,
          // imageUrl: existingFavoriteItem.imageUrl,
          // description: existingFavoriteItem.description,
          // quantity: existingFavoriteItem.quantity - 1,
          product: existingFavoriteItem.product,
        ),
      );
    } else {
      _favoriteItems.remove(products.id);
    }
    products.isFavorite = false;
    SharedWidget.showToastMsg('Delete From Favorite Success ', time: 4);
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach(
      (key, cartItem) {
        total += cartItem.product.price * cartItem.product.quantity;
        notifyListeners();
      },
    );
    return total;
  }

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

  bool _favorite = false;
  bool get getFavorite => _favorite;

  void changeFavoriteValue(bool favorite) {
    _favorite = favorite;
    notifyListeners();
  }
}
