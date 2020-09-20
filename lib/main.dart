import 'package:ecommerceapp/provider/homeProvider.dart';
import 'package:ecommerceapp/screens/cart_screen.dart';
import 'package:ecommerceapp/screens/favorite_screen.dart';
import 'package:ecommerceapp/screens/home_screen.dart';
import 'package:ecommerceapp/screens/order_screen.dart';
import 'package:ecommerceapp/screens/profile_screen.dart';
import 'package:ecommerceapp/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widget/bottom_bar_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.white,
          accentColor: Colors.redAccent.withOpacity(0.4),
        ),
//      home: HomeScreen(),
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          FavoriteScreen.route: (context) => FavoriteScreen(),
          CartScreen.route: (context) => CartScreen(),
          OrderScreen.route: (context) => OrderScreen(),
          HomeScreen.route: (context) => HomeScreen(),
          ProfileScreen.route: (context) => ProfileScreen(),
        },
      ),
    );
  }
}
