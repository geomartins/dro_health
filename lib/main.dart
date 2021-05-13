import 'package:dro_health/config/constants.dart';
import 'package:dro_health/providers/cart_provider.dart';
import 'package:dro_health/providers/product_details_provider.dart';
import 'package:dro_health/providers/products_provider.dart';
import 'package:dro_health/views/page_not_found.dart';
import 'package:dro_health/views/product_details.dart';
import 'package:dro_health/views/products.dart';
import 'package:dro_health/views/splash.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CartProvider(
      child: ProductDetailsProvider(
        child: ProductsProvider(
          child: MaterialApp(
            title: kAppName,
            theme: ThemeData(
                visualDensity: VisualDensity.adaptivePlatformDensity,
                fontFamily: 'Brand-Regular'),
            initialRoute: Splash.id,
            routes: {
              Products.id: (BuildContext ctx) => Products(),
              ProductDetails.id: (BuildContext ctx) => ProductDetails(),
              Splash.id: (BuildContext ctx) => Splash(),
            },
            onUnknownRoute: (settings) {
              return MaterialPageRoute(builder: (_) => PageNotFound());
            },
          ),
        ),
      ),
    );
  }
}

//TODO: Generate APK for the project
