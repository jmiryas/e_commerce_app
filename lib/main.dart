import 'package:e_commerce_app/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/theme.dart';
import '../config/app_router.dart';
import '../config/custom_app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist()))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "E-commerce App",
          theme: themeData(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: CustomAppRoute.homeScreen,
        ));
  }
}
