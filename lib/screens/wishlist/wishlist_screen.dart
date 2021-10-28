import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/wishlist_bloc.dart';
import '../../widgets/product_card_widget.dart';
import '../../widgets/custom_app_bar_widget.dart';
import '../../widgets/custom_bottom_appbar_widget.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Wishlist"),
      bottomNavigationBar: const CustomBottomAppBarWidget(),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is WishlistLoaded) {
            if (state.wishlist.products.isEmpty) {
              return const Center(
                child: Text("Wishlist is empty!"),
              );
            } else {
              return GridView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 16.0),
                  itemCount: state.wishlist.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 2.2,
                      mainAxisSpacing: 20.0),
                  itemBuilder: (context, index) {
                    return Center(
                      child: ProductCardWidget(
                        productModel: state.wishlist.products[index],
                        widthFactor: 1.1,
                        leftPosition: 30.0,
                        isWishlist: true,
                      ),
                    );
                  });
            }
          }

          return const Center(
            child: Text("Something went wrong!"),
          );
        },
      ),
    );
  }
}
