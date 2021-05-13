import 'dart:async';
import 'package:dro_health/models/product_model.dart';
import 'package:rxdart/rxdart.dart';

class ProductDetailsBloc extends Object {
  BehaviorSubject _product = new BehaviorSubject<ProductModel>();

  // SINKS
  void productSink(ProductModel value) {
    _product.sink.add(value);
  }

  //STREAMS
  Stream get product => _product.stream;

  //METHODS
  Future<void> submit() async {
    // try {
    //   await AuthService().passwordReset(validEmail);
    // } catch (e) {
    //   rethrow;
    // }
  }

  void dispose() {
    _product.close();
  }
}
