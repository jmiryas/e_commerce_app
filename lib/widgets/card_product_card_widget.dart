import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart/cart_bloc.dart';
import '../models/product_model.dart';

class CartProductCard extends StatelessWidget {
  final ProductModel productModel;

  const CartProductCard({Key? key, required this.productModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            productModel.imageUrl,
            width: 100.0,
            height: 100.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productModel.name,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                "\$${productModel.price}",
                style: Theme.of(context).textTheme.headline6,
              )
            ],
          )),
          const SizedBox(
            width: 10.0,
          ),
          BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            return Row(
              children: [
                IconButton(
                    onPressed: () {
                      context
                          .read<CartBloc>()
                          .add(CartRemovedProductEvent(productModel));

                      const snackBar =
                          SnackBar(content: Text("Removed to your cart!"));

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    icon: const Icon(Icons.remove_circle)),
                Text(
                  "1",
                  style: Theme.of(context).textTheme.headline5,
                ),
                IconButton(
                    onPressed: () {
                      context
                          .read<CartBloc>()
                          .add(CartAddedProductEvent(productModel));

                      const snackBar =
                          SnackBar(content: Text("Added to your cart!"));

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    icon: const Icon(Icons.add_circle))
              ],
            );
          })
        ],
      ),
    );
  }
}
