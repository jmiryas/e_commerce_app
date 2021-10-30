import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/widgets/custom_bottom_appbar_widget.dart';
import 'package:e_commerce_app/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar_widget.dart';
import '../../models/category_model.dart';

class CatalogScreen extends StatelessWidget {
  final CategoryModel categoryModel;

  const CatalogScreen({Key? key, required this.categoryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> productsCategory = ProductModel.products
        .where((product) => product.category == categoryModel.name)
        .toList();

    return Scaffold(
      appBar: CustomAppBarWidget(title: categoryModel.name),
      bottomNavigationBar: const CustomBottomAppBarWidget(),
      body: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          itemCount: productsCategory.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.15, mainAxisSpacing: 20.0),
          itemBuilder: (context, index) {
            return Center(
              child: ProductCardWidget(productModel: productsCategory[index]),
            );
          }),
    );
  }
}
