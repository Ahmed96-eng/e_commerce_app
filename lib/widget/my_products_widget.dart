import 'package:ecommerceapp/model/product.dart';
import 'package:ecommerceapp/provider/homeProvider.dart';
import 'package:ecommerceapp/screens/product_dashboard_screen.dart';
import 'package:ecommerceapp/widget/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MyProductsItem extends StatelessWidget {
  Product myProduct;
  MyProductsItem({this.myProduct});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: height * 0.15,
          color: Colors.grey.withOpacity(0.1),
          // margin: EdgeInsets.all(8),
          child: Row(
            children: [
              Container(
                width: width * 0.3,
                height: height * 0.2,
                child: myProduct.file != null
                    ? Image.file(
                        myProduct.file,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        myProduct.imageUrl,
                        fit: BoxFit.cover,
                      ),
              ),
              SizedBox(width: 16),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  width: width * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        myProduct.title,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "\$ ${myProduct.price.toString()}",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Consumer<HomeProvider>(
                  builder: (context, homeProvider, child) => Container(
                        width: width * 0.3,
                        child: Row(
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  size: 30,
                                ),
                                onPressed: () {
                                  SharedWidget.showAlertDailog(context,
                                      "Do you want to remove this item from Products?!!!",
                                      () {
                                    Navigator.of(context).pop(false);
                                  }, () {
                                    Navigator.of(context).pop(true);
                                    homeProvider.deleteProduct(myProduct.id);
                                  });
                                }),
                            IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  size: 30,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                      ProductDashBoardScreen.route,
                                      arguments: myProduct.id);
                                }),
                          ],
                        ),
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
