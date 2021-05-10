import 'package:dro_health/views/products.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  static const id = 'splash';
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 1,
      navigateAfterSeconds: Products(),
      imageBackground: AssetImage('assets/images/splash.png'),
      backgroundColor: Colors.white,
      loaderColor: Colors.white,
    );
  }
}
