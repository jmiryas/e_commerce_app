import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../models/product_model.dart';
import '../../models/category_model.dart';
import '../../widgets/section_title_widget.dart';
import '../../widgets/custom_app_bar_widget.dart';
import '../../widgets/product_carousel_widget.dart';
import '../../widgets/hero_carousel_card_widget.dart';
import '../../widgets/custom_bottom_appbar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: "Online Shop",
      ),
      bottomNavigationBar: const CustomBottomAppBarWidget(),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: CategoryModel.categories.map((category) {
              return HeroCarouselCardWidget(categoryModel: category);
            }).toList(),
          ),
          const SectionTitleWidget(title: "RECOMMENDED"),
          ProductCarouselWidget(
            products: ProductModel.products
                .where((product) => product.isRecommended)
                .toList(),
          ),
          const SectionTitleWidget(title: "MOST POPULAR"),
          ProductCarouselWidget(
            products: ProductModel.products
                .where((product) => product.isPopular)
                .toList(),
          )
        ],
      ),
    );
  }
}
