import 'package:flutter/material.dart';

Widget customTabs(
    {String id, @required String title, @required String imageUrl}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8),
    // height: 35,
    decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        border: Border.all(color: Colors.redAccent),
        borderRadius: BorderRadius.circular(20)),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              color: Colors.redAccent,
            ),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Tab(
          child: Text(title),
        ),
      ],
    ),
  );
}
