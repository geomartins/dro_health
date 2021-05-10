import 'package:dro_health/blocs/cart_bloc.dart';
import 'package:flutter/material.dart';

class CartProvider extends InheritedWidget {
  final bloc = CartBloc();

  CartProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static CartBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CartProvider>().bloc;
  }
}
