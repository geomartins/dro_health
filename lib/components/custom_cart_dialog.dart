import 'package:dro_health/components/custom_flat_button.dart';
import 'package:dro_health/config/constants.dart';
import 'package:flutter/material.dart';

class CustomCartDialog extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onDonePressed;
  final VoidCallback onViewPressed;

  CustomCartDialog(
      {this.title, this.description, this.onDonePressed, this.onViewPressed});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        alignment: Alignment.topCenter,
        overflow: Overflow.visible,
        children: [
          Container(
            width: 250.0,
            height: 220.0,
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: [
                    Text(
                      description,
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 12.0),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                SizedBox(
                  child: CustomFlatButton(
                      color: kSecondaryColor,
                      textColor: Colors.white,
                      title: 'View Bag',
                      radius: 0.0,
                      onPressed: onViewPressed),
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 5.0),
                SizedBox(
                  child: CustomFlatButton(
                      color: kSecondaryColor,
                      textColor: Colors.white,
                      title: 'Done',
                      radius: 0.0,
                      onPressed: onDonePressed),
                  width: MediaQuery.of(context).size.width,
                )
              ],
            ),
          ),
          Positioned(
            top: -30.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: CircleAvatar(
                    backgroundColor: kSecondaryColor,
                    maxRadius: 30.0,
                    child: Icon(
                      Icons.done,
                      size: 30.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 14.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
