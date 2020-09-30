import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const route = 'profile_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('My Profile Screen'),
      ),
      // bottomNavigationBar: BottomNavBarWidget(pageIndex: pageIndex),
    );
  }
}
