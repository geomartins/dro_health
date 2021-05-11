import 'package:dro_health/components/custom_flat_button.dart';
import 'package:dro_health/config/constants.dart';
import 'package:flutter/material.dart';

class CustomDraggableSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.09,
      minChildSize: 0.09,
      builder: (BuildContext context, ScrollController scrollController) {
        print(scrollController);
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
              color: kUniversalColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              )),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Container(
              height: MediaQuery.of(context).size.height - 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [buildHeaderField(), buildFooterField(context)],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildHeaderField() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10.0),
            Container(
              color: Colors.white,
              width: 50.0,
              height: 3.0,
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.card_travel_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    'Bag',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    maxRadius: 15.0,
                    backgroundColor: Colors.white,
                    child: Text(
                      '3',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  )
                  // Container(
                  //   width: 40.0,
                  //   height: 40.0,
                  // )
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Text(
                'Tap on an item for add, remove and delete options',
                style: TextStyle(fontSize: 9.0),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
            )
          ],
        ),
        ExpansionTile(
          tilePadding: EdgeInsets.all(0.0),
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                child: Text('AVN'),
                maxRadius: 20.0,
                backgroundColor: Colors.white,
              ),
              SizedBox(width: 10.0),
              Text(
                '1x',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          subtitle: Text('Vitamin E 400',
              style: TextStyle(color: Colors.white, fontSize: 11.0)),
          title: Text(
            'Shit is real',
            style: TextStyle(color: Colors.white, fontSize: 13.0),
          ),
          trailing: Text(
            'N923',
            style: TextStyle(color: Colors.white, fontSize: 13.0),
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.delete_outline_outlined,
                  color: Colors.white,
                  size: 30.0,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 15.0,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.remove_outlined,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.0),
                      child: Text(
                        '2',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    CircleAvatar(
                      maxRadius: 15.0,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.add,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildFooterField(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total',
                style: TextStyle(color: Colors.white, fontSize: 16.0)),
            Text('N34578',
                style: TextStyle(color: Colors.white, fontSize: 16.0))
          ],
        ),
        SizedBox(height: 15.0),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.5,
          child: CustomFlatButton(
              color: Colors.white,
              textColor: Colors.black87,
              title: 'Checkout',
              radius: 20.0,
              onPressed: () {}),
        )
      ],
    );
  }
}
