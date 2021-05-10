import 'package:dro_health/config/constants.dart';
import 'package:dro_health/providers/cart_provider.dart';
import 'package:dro_health/providers/product_details_provider.dart';
import 'package:dro_health/providers/product_search_provider.dart';
import 'package:dro_health/providers/products_provider.dart';
import 'package:dro_health/views/cart.dart';
import 'package:dro_health/views/page_not_found.dart';
import 'package:dro_health/views/product_details.dart';
import 'package:dro_health/views/product_search.dart';
import 'package:dro_health/views/products.dart';
import 'package:dro_health/views/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CartProvider(
      child: ProductDetailsProvider(
        child: ProductSearchProvider(
          child: ProductsProvider(
            child: MaterialApp(
              title: kAppName,
              theme: ThemeData(
                primarySwatch: kPrimaryColor,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              initialRoute: Splash.id,
              routes: {
                Products.id: (BuildContext ctx) => Products(),
                ProductDetails.id: (BuildContext ctx) => ProductDetails(),
                Cart.id: (BuildContext ctx) => Cart(),
                Splash.id: (BuildContext ctx) => Splash(),
                ProductSearch.id: (BuildContext ctx) => ProductSearch(),
              },
              onUnknownRoute: (settings) {
                return MaterialPageRoute(builder: (_) => PageNotFound());
              },
            ),
          ),
        ),
      ),
    );
  }
}

//TODO: Work on the products page
//TODO: Work on the product details page
//TODO: Work on the product search page
//TODO: Work on the cart page
//TODO: Generate APK for the project
