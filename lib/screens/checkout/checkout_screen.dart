import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/custom_app_route.dart';
import '../../bloc/checkout/checkout_bloc.dart';
import '../../widgets/order_summary_widget.dart';
import '../../widgets/custom_app_bar_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Checkout"),
      bottomNavigationBar:
          BlocBuilder<CheckoutBloc, CheckoutState>(builder: (context, state) {
        if (state is CheckoutLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is CheckoutLoadedState) {
          return BottomAppBar(
            color: Colors.black,
            child: SizedBox(
              height: 70.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {
                        context.read<CheckoutBloc>().add(
                            ConfirmCheckoutEvent(checkout: state.checkout));

                        const snackBar =
                            SnackBar(content: Text("Checkout is succed!"));

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        Navigator.pushNamed(context, CustomAppRoute.homeScreen);
                      },
                      child: Text("ORDER NOW",
                          style:
                              Theme.of(context).textTheme.headline3!.copyWith(
                                    color: Colors.black,
                                  )))
                ],
              ),
            ),
          );
        }

        return const Center(
          child: Text("Something went wrong!"),
        );
      }),
      body: BlocBuilder<CheckoutBloc, CheckoutState>(builder: (context, state) {
        if (state is CheckoutLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is CheckoutLoadedState) {
          return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CUSTOMER INFORMATION",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      _buildTextField((value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckoutEvent(email: value));
                      }, context, "Email", "Enter email ..."),
                      _buildTextField((value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckoutEvent(fullName: value));
                      }, context, "Full Name", "Enter full name ..."),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "DELIVERY INFORMATION",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      _buildTextField((value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckoutEvent(address: value));
                      }, context, "Address", "Enter address ..."),
                      _buildTextField((value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckoutEvent(city: value));
                      }, context, "City", "Enter city ..."),
                      _buildTextField((value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckoutEvent(country: value));
                      }, context, "Country", "Enter country ..."),
                      _buildTextField((value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckoutEvent(zipCode: value));
                      }, context, "Zip Code", "Enter zip code ..."),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "ORDER SUMMARY",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      const OrderSummaryWidget()
                    ],
                  )
                ],
              ));
        }

        return const Center(child: Text("Something went wrong!"));
      }),
    );
  }
}

Widget _buildTextField(Function(String)? onChanged, BuildContext context,
    String label, String hint) {
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 75.0,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
              child: TextFormField(
                  onChanged: onChanged,
                  decoration: InputDecoration(
                      hintText: hint,
                      isDense: true,
                      hintStyle: const TextStyle(fontSize: 12.0),
                      contentPadding: const EdgeInsets.only(left: 10.0),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)))))
        ],
      ));
}
