import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  static const String id = 'product_details';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text('Product Details Screen')],
        ),
      ),
    );
  }
}
