import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cart/cart_bloc.dart';
import '../../bloc/wishlist_bloc.dart';
import '../../models/product_model.dart';
import '../../config/custom_app_route.dart';
import '../../widgets/custom_app_bar_widget.dart';
import '../../widgets/hero_carousel_card_widget.dart';

class ProductScreen extends StatelessWidget {
  final ProductModel productModel;

  const ProductScreen({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: productModel.name),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 70.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                  )),
              BlocBuilder<WishlistBloc, WishlistState>(
                  builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    context
                        .read<WishlistBloc>()
                        .add(AddWishlistProduct(productModel));

                    const snackBar =
                        SnackBar(content: Text("Added to your wishlist!"));

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                );
              }),
              BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () {
                      context
                          .read<CartBloc>()
                          .add(CartAddedProductEvent(productModel));

                      const snackBar =
                          SnackBar(content: Text("Added to your cart!"));

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      Navigator.pushNamed(context, CustomAppRoute.cartScreen);
                    },
                    child: Text("ADD TO CART",
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                              color: Colors.black,
                            )));
              })
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: [
                HeroCarouselCardWidget(
                  productModel: productModel,
                )
              ]),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70.0,
                    alignment: Alignment.bottomCenter,
                    color: Colors.black.withAlpha(50),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    width: MediaQuery.of(context).size.width - 10.0,
                    height: 60.0,
                    alignment: Alignment.bottomCenter,
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                .headline5!
                                .copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ExpansionTile(
                initiallyExpanded: true,
                title: const Text("Product Information"),
                children: [
                  ListTile(
                      title: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyText1,
                  ))
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ExpansionTile(
                initiallyExpanded: false,
                title: const Text("Delivery Information"),
                children: [
                  ListTile(
                      title: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyText1,
                  ))
                ]),
          )
        ],
      ),
    );
  }
}
