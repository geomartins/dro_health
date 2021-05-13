import 'package:dro_health/blocs/products_bloc.dart';
import 'package:dro_health/config/constants.dart';
import 'package:dro_health/models/product_model.dart';
import 'package:dro_health/providers/product_details_provider.dart';
import 'package:dro_health/views/product_details.dart';
import 'package:flutter/material.dart';

class CustomProductGridView extends StatelessWidget {
  final List<ProductModel> data;
  final ProductsBloc bloc;

  CustomProductGridView({@required this.data, @required this.bloc});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 70.0),
              child: GridView.builder(
                physics: ScrollPhysics(),
                itemCount: data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 2 : 3),
                itemBuilder: (BuildContext context, int index) {
                  print(data);
                  print('fffffffffffffff');
                  return CustomProductGridTile(
                    data: data,
                    index: index,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomProductGridTile extends StatelessWidget {
  final int index;
  final List<ProductModel> data;
  const CustomProductGridTile({
    Key key,
    this.index,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productDetailsBloc = ProductDetailsProvider.of(context);
    final name = data[index].name;
    final category = data[index].category;
    final price = data[index].price;
    final caption = data[index].caption;
    final image = data[index].image;

    return GestureDetector(
      onTap: () {
        productDetailsBloc.productSink(data[index]);
        Navigator.pushNamed(context, ProductDetails.id);
      },
      child: Container(
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
                child: Image.asset('assets/images/$image'),
                //height: 100.0,
                //color: Colors.teal,
              ),
              flex: 3,
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
                //height: 100.0,
                //color: Colors.black12,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Text(name,
                            style: TextStyle(
                                color: Colors.black87, fontSize: 13.0)),
                        SizedBox(height: 5.0),
                        Text(category,
                            style: TextStyle(
                                color: kTertiaryColor, fontSize: 11.0)),
                        Text(caption,
                            style: TextStyle(
                                color: kTertiaryColor, fontSize: 11.0)),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    Positioned(
                      child: Container(
                          decoration: BoxDecoration(
                              color: kTertiaryColor,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Text(
                            'N$price',
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.white),
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
      ),
    );
  }
}
