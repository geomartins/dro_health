import 'package:flutter/material.dart';

class CustomToolBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade200,
          ),
          padding: EdgeInsets.all(5.0),
          child: GestureDetector(
            child: Icon(Icons.import_export_outlined),
            onTap: () {
              print('hello');
            },
          ),
          margin: EdgeInsets.symmetric(horizontal: 10.0),
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade200,
          ),
          padding: EdgeInsets.all(5.0),
          child: GestureDetector(
            child: Icon(Icons.search),
            onTap: () {
              print('hello');
            },
          ),
          margin: EdgeInsets.symmetric(horizontal: 10.0),
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade200,
          ),
          padding: EdgeInsets.all(5.0),
          child: GestureDetector(
            child: Icon(
              Icons.filter_alt_outlined,
            ),
            onTap: () {
              print('hello');
            },
          ),
          margin: EdgeInsets.symmetric(horizontal: 10.0),
        ),
      ],
    );
  }
}
