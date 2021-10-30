import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart/cart_bloc.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      if (state is CartLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is CartLoadedState) {
        return Column(
          children: [
            const Divider(
              thickness: 2,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "SUBTOTAL",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          "Rp ${state.cart.subtotalString}",
                          style: Theme.of(context).textTheme.headline5,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "DELIVERY FEE",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          "Rp ${state.cart.deliveryFeeString}",
                          style: Theme.of(context).textTheme.headline5,
                        )
                      ],
                    )
                  ],
                )),
            const SizedBox(
              height: 10.0,
            ),
            Stack(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60.0,
                    decoration:
                        BoxDecoration(color: Colors.black.withAlpha(50))),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  decoration: const BoxDecoration(color: Colors.black),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "TOTAL",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          "Rp ${state.cart.totalString}",
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
            )
          ],
        );
      }

      return const Center(
        child: Text("Something went wrong!"),
      );
    });
  }
}
