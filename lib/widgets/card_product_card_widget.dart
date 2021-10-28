import 'package:flutter/material.dart';

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
          Row(
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.remove_circle)),
              Text(
                "0",
                style: Theme.of(context).textTheme.headline5,
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle))
            ],
          )
        ],
      ),
    );
  }
}
