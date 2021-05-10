import 'package:dro_health/blocs/product_details_bloc.dart';
import 'package:flutter/material.dart';

class ProductDetailsProvider extends InheritedWidget {
  final bloc = ProductDetailsBloc();

  ProductDetailsProvider({Key key, Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static ProductDetailsBloc of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ProductDetailsProvider>()
        .bloc;
  }
}
