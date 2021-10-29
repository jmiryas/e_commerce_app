import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/wishlist_bloc.dart';
import '../bloc/cart/cart_bloc.dart';
import '../models/product_model.dart';
import '../config/custom_app_route.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductModel productModel;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlist;

  const ProductCardWidget(
      {Key? key,
      required this.productModel,
      this.widthFactor = 2.5,
      this.leftPosition = 5.0,
      this.isWishlist = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthValue = MediaQuery.of(context).size.width / widthFactor;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, CustomAppRoute.productScreen,
            arguments: productModel);
      },
      child: Stack(
        children: [
          SizedBox(
            width: widthValue,
            height: 150.0,
            child: Image.network(
              productModel.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              top: 60.0,
              left: leftPosition,
              child: Container(
                  width: widthValue - 10.0 - leftPosition,
                  height: 80.0,
                  decoration:
                      BoxDecoration(color: Colors.black.withAlpha(50)))),
          Positioned(
              top: 65.0,
              left: leftPosition + 5,
              child: Container(
                width: widthValue - 20 - leftPosition,
                height: 70.0,
                decoration: const BoxDecoration(color: Colors.black),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productModel.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              "Rp ${productModel.price}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                        return Expanded(
                            child: IconButton(
                                onPressed: () {
                                  context
                                      .read<CartBloc>()
                                      .add(CartAddedProductEvent(productModel));

                                  const snackBar = SnackBar(
                                      content: Text("Added to your cart!"));

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                icon: const Icon(Icons.add_circle,
                                    color: Colors.white)));
                      }),
                      isWishlist
                          ? BlocBuilder<WishlistBloc, WishlistState>(
                              builder: (context, state) {
                              return Expanded(
                                  child: IconButton(
                                      onPressed: () {
                                        context.read<WishlistBloc>().add(
                                            RemoveWishlistProduct(
                                                productModel));

                                        const snackBar = SnackBar(
                                            content: Text(
                                                "Removed from your wishlist!"));

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      },
                                      icon: const Icon(Icons.delete,
                                          color: Colors.white)));
                            })
                          : const SizedBox()
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
