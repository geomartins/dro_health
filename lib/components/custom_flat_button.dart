import 'package:dro_health/config/constants.dart';
import 'package:flutter/material.dart';

class CustomFlatButton extends FlatButton {
  final Color color;
  final Color textColor;
  final String title;
  final VoidCallback onPressed;
  final double radius;
  final IconData icon;

  CustomFlatButton(
      {@required this.color,
      @required this.textColor,
      @required this.title,
      @required this.onPressed,
      this.icon,
      this.radius})
      : super(
          disabledColor: kPrimaryColor,
          color: color,
          child: icon == null
              ? Text(
                  title,
                  style: TextStyle(color: textColor),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: textColor,
                      size: 20.0,
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      title,
                      style: TextStyle(color: textColor),
                    )
                  ],
                ),
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 5.0),
            //side: BorderSide(color: Colors.red)
          ),
        );
}
