import 'package:e_commerce_app/bloc/category/category_bloc.dart';
import 'package:e_commerce_app/bloc/checkout/checkout_bloc.dart';
import 'package:e_commerce_app/bloc/product/product_bloc.dart';
import 'package:e_commerce_app/repositories/category/category_repository.dart';
import 'package:e_commerce_app/repositories/checkout/checkout_repository.dart';
import 'package:e_commerce_app/repositories/product/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import '../config/theme.dart';
import '../config/app_router.dart';
import '../bloc/wishlist_bloc.dart';
import '../bloc/cart/cart_bloc.dart';
import '../config/custom_app_route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
          BlocProvider(create: (_) => CartBloc()..add(CartInitialEvent())),
          BlocProvider(
              create: (_) =>
                  CategoryBloc(categoryRepository: CategoryRepository())
                    ..add(LoadCategoryEvent())),
          BlocProvider(
              create: (_) => ProductBloc(productRepository: ProductRepository())
                ..add(LoadProductEvent())),
          BlocProvider(
              create: (context) => CheckoutBloc(
                  cartBloc: context.read<CartBloc>(),
                  checkoutRepository: CheckoutRepository())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "E-commerce App",
          theme: themeData(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: CustomAppRoute.splashScreen,
        ));
  }
}
