import 'package:ecommerceapp/model/order.dart';
import 'package:ecommerceapp/screens/cart_screen.dart';
import 'package:ecommerceapp/screens/favorite_screen.dart';
import 'package:ecommerceapp/screens/home_screen.dart';
import 'package:ecommerceapp/screens/order_screen.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Text(
                'Hello',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Divider(
                height: 25,
                thickness: 3,
                color: Colors.redAccent.withOpacity(0.4),
              ),
              ListTileWidget(
                title: 'Home Screen',
                icon: Icons.shop,
                page: HomeScreen(),
              ),
              ListTileWidget(
                title: 'Order Screen',
                icon: Icons.card_travel,
                page: OrderScreen(),
              ),
              ListTileWidget(
                title: 'Cart Screen',
                icon: Icons.add_shopping_cart,
                page: CartScreen(),
              ),
              ListTileWidget(
                title: 'Favorite Screen',
                icon: Icons.favorite_border,
                page: FavoriteScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  IconData icon;
  String title;
  Widget page;
  ListTileWidget({
    this.title,
    this.icon,
    this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        child: ListTile(
          hoverColor: Colors.red,
          focusColor: Colors.amber,
          leading: Icon(
            icon,
            color: Colors.red,
            size: 25,
          ),
          title: Text(
            title,
            style: TextStyle(
                color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
      ),
    );
  }
}
