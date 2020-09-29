import 'package:flutter/material.dart';

Widget customTabs(
    {String id, @required String title, @required String imageUrl}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8),
    // height: 35,
    decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        border: Border.all(
          color: Colors.redAccent.withOpacity(0.4),
        ),
        borderRadius: BorderRadius.circular(15)),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            width: 50,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              color: Colors.grey[300],
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover),
              border: Border.all(color: Colors.redAccent.withOpacity(0.4)),
            ),
            // child: Image.network(
            //   imageUrl,
            //   fit: BoxFit.cover,
            // ),
          ),
        ),
        Tab(
          child: Text(title),
        ),
      ],
    ),
  );
}
