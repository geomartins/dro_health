import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  static const String id = 'cart';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text('Cart Screen')],
        ),
      ),
    );
  }
}
