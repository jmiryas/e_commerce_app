import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../models/category_model.dart';
import '../config/custom_app_route.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/error/error_screen.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/catalog/catalog_screen.dart';
import '../screens/product/product_screen.dart';
import '../screens/wishlist/wishlist_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CustomAppRoute.homeScreen:
        return CustomAppRoute.goToRoute(
            const HomeScreen(), CustomAppRoute.homeScreen);
      case CustomAppRoute.cartScreen:
        return CustomAppRoute.goToRoute(
            const CartScreen(), CustomAppRoute.cartScreen);
      case CustomAppRoute.catalogScreen:
        return CustomAppRoute.goToRoute(
            CatalogScreen(
              categoryModel: settings.arguments as CategoryModel,
            ),
            CustomAppRoute.catalogScreen);
      case CustomAppRoute.productScreen:
        return CustomAppRoute.goToRoute(
            ProductScreen(
              productModel: settings.arguments as ProductModel,
            ),
            CustomAppRoute.productScreen);
      case CustomAppRoute.wishlistScreen:
        return CustomAppRoute.goToRoute(
            const WishlistScreen(), CustomAppRoute.wishlistScreen);
      case CustomAppRoute.splashScreen:
        return CustomAppRoute.goToRoute(
            const SplashScreen(), CustomAppRoute.splashScreen);
      default:
        return CustomAppRoute.goToRoute(
            const ErrorScreen(), CustomAppRoute.errorScreen);
    }
  }
}
