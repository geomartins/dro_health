import 'package:dro_health/models/product_model.dart';

class CartModel {
  final String uid;
  final String name;
  final String category;
  final String image;
  double price;
  double unitPrice;
  int quantity;

  CartModel.fromProductModel(ProductModel productModel)
      : name = productModel.name,
        uid = productModel.uid,
        category = productModel.category,
        image = productModel.image,
        price = productModel.price,
        unitPrice = productModel.price,
        quantity = 1;
}
