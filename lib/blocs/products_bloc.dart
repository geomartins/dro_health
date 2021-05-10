import 'dart:async';
import 'package:rxdart/rxdart.dart';

class ProductsBloc extends Object {
  BehaviorSubject _email = new BehaviorSubject<String>();
  BehaviorSubject _isLoading = new BehaviorSubject<bool>();

  // SINKS
  void emailSink(String value) {
    _email.sink.add(value);
    _listeners();
  }

  void loadingSink(bool value) {
    _isLoading.sink.add(value);
  }

  //STREAMS
  Stream get email => _email.stream;

  Stream get isLoading => _isLoading.stream;

  //LISTENERS
  String validEmail = '';
  void _listeners() {
    email.listen((event) => validEmail = event);
  }

  //METHODS
  Future<void> submit() async {
    // try {
    //   await AuthService().passwordReset(validEmail);
    // } catch (e) {
    //   rethrow;
    // }
  }

  void dispose() {
    _email.close();
    _isLoading.close();
  }
}
