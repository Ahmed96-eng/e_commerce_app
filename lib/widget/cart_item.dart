// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class CartItem extends StatelessWidget {
//   String title, imagUrl, id, totalProductPrice;
//   double price;
//   int quantity;
//   Function onpressed2, onpressed3;
//   CartItem(
//       {this.id,
//       this.title,
//       this.imagUrl,
//       this.price,
//       this.quantity,
//       this.totalProductPrice,
//       this.onpressed2,
//       this.onpressed3});

//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(15),
//         child: Container(
//           height: height * 0.17,
//           color: Colors.red[50],
//           // margin: EdgeInsets.all(8),
//           child: Row(
//             children: [
//               Container(
//                 width: width * 0.3,
//                 height: height * 0.2,
//                 child: Image.network(
//                   imagUrl,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               SizedBox(width: 16),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       softWrap: true,
//                       overflow: TextOverflow.fade,
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 5),
//                     Text('Price: ' + '\$ ' + price.toString()),
//                     SizedBox(height: 5),
//                     Text(
//                       'TotalProducrPrice: ' +
//                           '\$ ' +
//                           totalProductPrice.toString(),
//                       softWrap: true,
//                       overflow: TextOverflow.fade,
//                       style:
//                           TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                     ),
//                     Expanded(
//                       child: Center(
//                         child: Row(
//                           children: [
//                             IconButton(
//                                 icon: Icon(
//                                   Icons.remove_circle,
//                                   size: 30,
//                                 ),
//                                 onPressed: () {
//                                   onpressed2;
//                                 }),
//                             Text(
//                               quantity.toString(),
//                               softWrap: true,
//                               overflow: TextOverflow.fade,
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.bold),
//                             ),
//                             IconButton(
//                                 icon: Icon(
//                                   Icons.add_circle,
//                                   size: 30,
//                                 ),
//                                 onPressed: () {
//                                   onpressed3;
//                                 }),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
