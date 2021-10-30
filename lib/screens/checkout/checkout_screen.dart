import 'package:e_commerce_app/widgets/order_summary_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController zipCodeController = TextEditingController();

    return Scaffold(
      appBar: CustomAppBarWidget(title: "Checkout"),
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
                  child: Text("ORDER NOW",
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Colors.black,
                          )))
            ],
          ),
        ),
      ),
      body: Padding(
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
                  _buildTextField(
                      emailController, context, "Email", "Enter email ..."),
                  _buildTextField(nameController, context, "Full Name",
                      "Enter full name ..."),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "DELIVERY INFORMATION",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  _buildTextField(addressController, context, "Address",
                      "Enter address ..."),
                  _buildTextField(
                      cityController, context, "City", "Enter city ..."),
                  _buildTextField(countryController, context, "Country",
                      "Enter country ..."),
                  _buildTextField(zipCodeController, context, "Zip Code",
                      "Enter zip code ..."),
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
          )),
    );
  }
}

Widget _buildTextField(TextEditingController controller, BuildContext context,
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
                  controller: controller,
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
