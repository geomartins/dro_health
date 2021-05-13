import 'dart:async';
import 'package:dro_health/models/cart_model.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc extends Object {
  BehaviorSubject _cart = new BehaviorSubject<List<CartModel>>();
  BehaviorSubject _quantity = new BehaviorSubject<int>();

  // SINKS
  void cartSink(CartModel value, [int quantity = 1]) {
    List<CartModel> oldCarts = _cart.value ?? [];

    int index = oldCarts.indexWhere((element) => element.uid == value.uid);
    print('My index is $index ');
    if (index < 0) {
      value.quantity = quantity;
      oldCarts.add(value);
      _cart.sink.add(oldCarts);
    } else {
      cartIncrease(index, quantity);
    }
  }

  void quantitySink(int value) {
    _quantity.sink.add(value);
  }

  void cartRemove(int index) {
    List<CartModel> oldCarts = [..._cart.value];
    oldCarts.removeAt(index);
    _cart.sink.add(oldCarts);
  }

  void cartIncrease(int index, [int quantity = 1]) {
    List<CartModel> oldCarts = [..._cart.value];
    oldCarts[index].quantity = oldCarts[index].quantity + quantity;
    _cart.sink.add(oldCarts);
  }

  void cartDecrease(int index) {
    List<CartModel> oldCarts = [..._cart.value];
    if (oldCarts[index].quantity < 2) {
      //remove the item
      cartRemove(index);
    } else {
      //decrease the item
      oldCarts[index].quantity = oldCarts[index].quantity - 1;
      _cart.sink.add(oldCarts);
    }
  }

  void cartClear() {
    List<CartModel> data = [];
    _cart.sink.add(data);
  }

  Future<void> checkout() async {
    await Future.delayed(Duration(milliseconds: 1));
    cartClear();
    return null;
  }

  //STREAMS
  Stream get cart => _cart.stream;
  Stream get quantity => _quantity.stream;

  void dispose() {
    _cart.close();
    _quantity.close();
  }
}
