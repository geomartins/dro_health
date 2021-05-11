import 'package:dro_health/components/custom_draggable_sheet.dart';
import 'package:dro_health/components/custom_product_grid_view.dart';
import 'package:dro_health/components/custom_search_bar.dart';
import 'package:dro_health/components/custom_tool_bar.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  static const String id = 'products';
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Container(
              height: deviceHeight,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      height: 50.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: Colors.black87,
                          ),
                          Text(
                            '125 Items',
                            style: TextStyle(
                                color: Colors.black87, fontSize: 14.0),
                          ),
                          Container()
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    CustomToolBar(),
                    SizedBox(height: 10.0),
                    CustomSearchBar(),
                    SizedBox(height: 20.0),
                    CustomProductGridView(),
                  ],
                ),
              ),
            ),
          ),
          CustomDraggableSheet(),
        ],
      ),
    );
  }
}
