import 'package:dro_health/config/constants.dart';
import 'package:flutter/material.dart';

class CustomProductLabel extends StatelessWidget {
  final String name;
  final String description;
  final IconData icon;
  const CustomProductLabel({
    Key key,
    this.name,
    this.description,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, color: kPrimaryColor),
        SizedBox(width: 10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  color: kTertiaryColor.withOpacity(0.9), fontSize: 10.0),
            ),
            Text(description, style: TextStyle(fontSize: 14.0))
          ],
        )
      ],
    );
  }
}
