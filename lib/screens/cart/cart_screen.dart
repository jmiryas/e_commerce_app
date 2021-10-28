import 'package:e_commerce_app/models/cart_model.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar_widget.dart';
import '../../widgets/card_product_card_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Cart"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(CartModel().freeDeliveryString,
                        style: Theme.of(context).textTheme.headline5),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(primary: Colors.black),
                        child: Text(
                          "Add More Items",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ))
                  ],
                ),
                const SizedBox(height: 25.0),
                SizedBox(
                  height: 250.0,
                  child: ListView.builder(
                      itemCount: CartModel().products.length,
                      itemBuilder: (context, index) {
                        return CartProductCard(
                            productModel: CartModel().products[index]);
                      }),
                ),
              ],
            ),
            Column(
              children: [
                const Divider(
                  thickness: 2.0,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("SUBTOTAL",
                                style: Theme.of(context).textTheme.headline5),
                            Text("\$${CartModel().subtotalString}",
                                style: Theme.of(context).textTheme.headline5),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("DELIVERY FEE",
                                style: Theme.of(context).textTheme.headline5),
                            Text("\$${CartModel().deliveryFeeString}",
                                style: Theme.of(context).textTheme.headline5),
                          ],
                        )
                      ],
                    )),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60.0,
                      decoration:
                          BoxDecoration(color: Colors.black.withAlpha(50)),
                    ),
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
                            Text("TOTAL",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.white)),
                            Text("\$${CartModel().totalString}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.white)),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 70.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {},
                  child: Text("GO TO CHECKOUT",
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Colors.black,
                          )))
            ],
          ),
        ),
      ),
    );
  }
}
