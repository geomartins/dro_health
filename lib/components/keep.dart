import 'package:dro_health/blocs/products_bloc.dart';
import 'package:dro_health/config/constants.dart';
import 'package:dro_health/models/product_model.dart';
import 'package:flutter/material.dart';

class CustomProductGridView extends StatelessWidget {
  final List<ProductModel> data;
  final ProductsBloc bloc;

  CustomProductGridView({@required this.data, @required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 70.0),
              child: GridView.count(
                physics: ScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 14.0,
                childAspectRatio: MediaQuery.of(context).size.height / 800,
                children: List.generate(20, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5.0,
                          spreadRadius: 0.5,
                          offset: Offset(0.7, 0.7),
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            child: FlutterLogo(
                              size: 100.0,
                            ),
                            //height: 100.0,
                            //color: Colors.teal,
                          ),
                          flex: 3,
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 5.0),
                            //height: 100.0,
                            //color: Colors.black12,
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Text('Product Title ${index + 1}',
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 13.0)),
                                    SizedBox(height: 5.0),
                                    Text(
                                        'Product Description Product DescriptionProduct Description',
                                        style: TextStyle(
                                            color: kTertiaryColor,
                                            fontSize: 11.0)),
                                  ],
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                                Positioned(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: kTertiaryColor,
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: Text(
                                        'N12000',
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.white),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.0, vertical: 3.0)),
                                  right: 0,
                                  bottom: 10,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
