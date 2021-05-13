import 'dart:async';
import 'package:dro_health/models/product_model.dart';
import 'package:dro_health/services/database_service.dart';
import 'package:rxdart/rxdart.dart';

class ProductsBloc extends Object {
  BehaviorSubject _products = new BehaviorSubject<List<ProductModel>>();
  BehaviorSubject _searchToggle = new BehaviorSubject<bool>();

  // SINKS
  void productsSink(List<ProductModel> value) {
    _products.sink.add(value);
  }

  void searchToggleSink(bool value) {
    _searchToggle.sink.add(value);
  }

  //STREAMS
  Stream get products => _products.stream;
  Stream get searchToggle => _searchToggle.stream;

  void fetchProducts() {
    List<Map<String, dynamic>> datas = DatabaseService().fetchProducts();
    List<ProductModel> result = [];
    for (Map<String, dynamic> x in datas) {
      result.add(ProductModel.fromDatabase(x));
    }
    if (result.length > 0) {
      productsSink(result);
    }
    return null;
  }

  void searchProducts(String value) {
    if (value == "") {
      fetchProducts();
      return;
    }
    List<ProductModel> searchResult = DatabaseService().searchProducts(value);
    productsSink(searchResult);
  }

  void dispose() {
    _products.close();
    _searchToggle.close();
  }
}
