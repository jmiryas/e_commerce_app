import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../widgets/product_card_widget.dart';

class ProductCarouselWidget extends StatelessWidget {
  final List<ProductModel> products;

  const ProductCarouselWidget({Key? key, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: ProductCardWidget(
                productModel: products[index],
              ),
            );
          }),
    );
  }
}
