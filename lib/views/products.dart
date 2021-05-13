import 'package:dro_health/components/custom_draggable_sheet.dart';
import 'package:dro_health/components/custom_product_grid_view.dart';
import 'package:dro_health/components/custom_search_bar.dart';
import 'package:dro_health/components/custom_tool_bar.dart';
import 'package:dro_health/models/product_model.dart';
import 'package:dro_health/providers/products_provider.dart';
import 'package:dro_health/views/page_not_found.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  static const String id = 'products';
  final double initialChildSize;
  const Products({Key key, this.initialChildSize = 0.09}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bloc = ProductsProvider.of(context);

    bloc.fetchProducts();
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
                          GestureDetector(
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black87,
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, PageNotFound.id);
                            },
                          ),
                          StreamBuilder<List<ProductModel>>(
                              stream: bloc.products,
                              initialData: [],
                              builder: (context, productsSnapshot) {
                                final data = productsSnapshot.data;
                                return data.length > 0
                                    ? Text(
                                        '${data.length} ${data.length < 2 ? 'Item' : 'Items'}',
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 14.0),
                                      )
                                    : Container();
                              }),
                          Container()
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    CustomToolBar(bloc: bloc),
                    SizedBox(height: 10.0),
                    CustomSearchBar(bloc: bloc),
                    SizedBox(height: 20.0),
                    StreamBuilder<List<ProductModel>>(
                        stream: bloc.products,
                        initialData: [],
                        builder: (context, productsSnapshot) {
                          final data = productsSnapshot.data;
                          return data.length > 0
                              ? CustomProductGridView(
                                  bloc: bloc,
                                  data: data,
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: Text(
                                        'No item found',
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 14.0),
                                      ),
                                    )
                                  ],
                                );
                        }),
                  ],
                ),
              ),
            ),
          ),
          CustomDraggableSheet(initialChildSize: initialChildSize),
        ],
      ),
    );
  }
}
