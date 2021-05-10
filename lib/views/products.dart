import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  static const String id = 'products';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text('Products Screen')],
        ),
      ),
    );
  }
}
