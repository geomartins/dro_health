import 'package:dro_health/blocs/product_search_bloc.dart';
import 'package:flutter/material.dart';

class ProductSearchProvider extends InheritedWidget {
  final bloc = ProductSearchBloc();

  ProductSearchProvider({Key key, Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static ProductSearchBloc of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ProductSearchProvider>()
        .bloc;
  }
}
