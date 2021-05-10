import 'package:dro_health/blocs/products_bloc.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends InheritedWidget {
  final bloc = ProductsBloc();

  ProductsProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static ProductsBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ProductsProvider>().bloc;
  }
}
