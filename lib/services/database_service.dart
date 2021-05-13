import 'package:dro_health/models/product_model.dart';

class DatabaseService {
  List<Map<String, dynamic>> fetchProducts() {
    return [
      {
        "uid": "xfgfjguy1",
        "image": "1.jpg",
        "name": "Garlic Oil",
        "caption": "Soft Gel - 650mg",
        "description": "1 pack of garlic oil contain 10 tablets",
        "brand": "Emzor Pharmaceuticals",
        "category": "Soft Gel",
        "price": 385.0,
        "size": "3x10",
        "packaging": "Packs",
        "constituent": "Garlic Oil",
      },
      {
        "uid": "xfgfjguy2",
        "image": "2.jpg",
        "name": "Ginger Oil",
        "caption": "Soft Gel - 650mg",
        "description": "1 pack of garlic oil contain 10 tablets",
        "brand": "Emzor Pharmaceuticals",
        "category": "Soft Gel",
        "price": 385.0,
        "size": "3x10",
        "packaging": "Packs",
        "constituent": "Garlic Oil",
      },
      {
        "uid": "xfgfjguy3",
        "image": "3.jpg",
        "name": "First Aid Kit",
        "caption": "0.7L Red Bag",
        "description": "10.7L Red Camping Emergency Survival Bag",
        "brand": "TLS Pharmaceuticals",
        "category": "Bags",
        "price": 3895.0,
        "size": "3x10",
        "packaging": "Packs",
        "constituent": "Garlic Oil",
      },
      {
        "uid": "efg348hfeg",
        "image": "4.jpg",
        "name": "Natural B-Carotene",
        "caption": "Capsule Drug for Fertility",
        "description": "Enrich in Protein, Lowers risk of fat",
        "brand": "Norland Pharmaceuticals",
        "category": "Capsule",
        "price": 15000.0,
        "size": "3x10",
        "packaging": "Packs",
        "constituent": "B-Carotene",
      },
      {
        "uid": "ccvvs48hfeg",
        "image": "5.jpg",
        "name": "Neurogesic Ointment",
        "caption": "Alcohol Free",
        "description":
            "greaseless and stainless ointment for analgesic preparation",
        "brand": "Drugfield Pharmaceuticals",
        "category": "Cream",
        "price": 1799.0,
        "size": "3x10",
        "packaging": "Packs",
        "constituent": "Unknown",
      },
      {
        "uid": "f888548hfeg",
        "image": "6.jpg",
        "name": "MQ Pain Relief Patch",
        "caption": "Alcohol Free",
        "description": "greaseless and stainless pain relief patch",
        "brand": "MQ Pharmaceuticals",
        "category": "Patch",
        "price": 6899.0,
        "size": "3x10",
        "packaging": "Packs",
        "constituent": "Unknown",
      },
    ];
  }

  List<ProductModel> searchProducts(String value) {
    final List<Map<String, dynamic>> datas = fetchProducts();
    List<ProductModel> result = [];

    for (Map<String, dynamic> x in datas) {
      if (x['name'].toString().toLowerCase().contains(value.toLowerCase())) {
        result.add(ProductModel.fromDatabase(x));
      }
    }

    return result;
  }
}
