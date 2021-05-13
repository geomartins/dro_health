class ProductModel {
  final String uid;
  final String image;
  final String name;
  final String caption;
  final String description;
  final String brand;
  final String category;
  final double price;
  final String size;
  final String packaging;
  final String constituent;

  ProductModel.fromDatabase(Map<String, dynamic> parsedJson)
      : uid = parsedJson['uid'],
        image = parsedJson['image'],
        name = parsedJson['name'],
        caption = parsedJson['caption'],
        brand = parsedJson['brand'],
        category = parsedJson['category'],
        description = parsedJson['description'],
        price = parsedJson['price'],
        size = parsedJson['size'],
        packaging = parsedJson['packaging'],
        constituent = parsedJson['constituent'];
}
