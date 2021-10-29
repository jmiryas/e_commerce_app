import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cart/cart_bloc.dart';
import '../../config/custom_app_route.dart';
import '../../widgets/custom_app_bar_widget.dart';
import '../../widgets/card_product_card_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Cart"),
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
      body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        if (state is CartLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is CartLoadedState) {
          if (state.cart.products.isEmpty) {
            return Center(
              child: Text("Cart is empty ..."),
            );
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: SizedBox(
                            width: 100.0,
                            child: Text(
                              "Add \$20.0 for FREE DELIVERY",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          )),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, CustomAppRoute.homeScreen);
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.black, elevation: 0),
                              child: Text(
                                "Add More Items",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.white),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: 230.0,
                        child: ListView.builder(
                            itemCount: state.cart.products.length,
                            itemBuilder: (context, index) {
                              return CartProductCard(
                                productModel: state.cart.products[index],
                              );
                            }),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Divider(
                        thickness: 2,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "SUBTOTAL",
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  Text(
                                    "\$5.0",
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "DELIVERY FEE",
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  Text(
                                    "\$15000.0",
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  )
                                ],
                              )
                            ],
                          )),
                      SizedBox(
                        height: 10.0,
                      ),
                      Stack(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 60.0,
                              decoration: BoxDecoration(
                                  color: Colors.black.withAlpha(50))),
                          Container(
                            margin: EdgeInsets.all(5.0),
                            width: MediaQuery.of(context).size.width,
                            height: 50.0,
                            decoration: BoxDecoration(color: Colors.black),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "TOTAL",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    "\$15.0",
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
                  )
                ],
              ),
            );
          }
        }

        return Center(
          child: Text("Something went wrong!"),
        );
      }),
    );
  }
}
