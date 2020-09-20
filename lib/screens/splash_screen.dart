import 'dart:async';
import 'package:ecommerceapp/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }
}

initScreen(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.redAccent.withOpacity(0.4),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 60,
            child: Image.asset(
              "assets/logo.png",
              fit: BoxFit.cover,
              // width: 500,
              // height: 800,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20.0, bottom: 10)),
          Text(
            "Ecommerce App",
            style: TextStyle(fontSize: 24.0, color: Colors.white),
          ),
          Padding(padding: EdgeInsets.only(top: 20.0, bottom: 10)),
          CircularProgressIndicator(
            backgroundColor: Colors.white,
            strokeWidth: 1.5,
          )
        ],
      ),
    ),
  );
}
