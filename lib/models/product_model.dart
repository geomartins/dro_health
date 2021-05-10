class ProductModel {
  final String uid;
  final String name;
  final String description;
  final double price;
  final String size;
  final String packaging;
  final String constituent;

  ProductModel.fromDatabase(Map<String, dynamic> parsedJson)
      : uid = parsedJson['uid'],
        name = parsedJson['name'],
        description = parsedJson['description'],
        price = parsedJson['price'],
        size = parsedJson['size'],
        packaging = parsedJson['packaging'],
        constituent = parsedJson['constituent'];
}
