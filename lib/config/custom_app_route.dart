import 'package:flutter/material.dart';

class CustomAppRoute {
  // * Routes:

  static const String homeScreen = "/";
  static const String cartScreen = "/cart";
  static const String errorScreen = "/error";
  static const String splashScreen = "/splash";
  static const String catalogScreen = "/catalog";
  static const String productScreen = "/product";
  static const String wishlistScreen = "/wishlist";

  // * Go to route:

  static Route goToRoute(dynamic screen, String routeName) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (context) => screen);
  }
}
