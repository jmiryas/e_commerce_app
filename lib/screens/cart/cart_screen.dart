import 'package:flutter/material.dart';

import '../../models/product_model.dart';
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
                    Text("Add \$20.0 for FREE delivery!",
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
                CartProductCard(productModel: ProductModel.products[0]),
                CartProductCard(productModel: ProductModel.products[0]),
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
                            Text("\$5.98",
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
                            Text("\$5.98",
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
                            Text("\$5.98",
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
