import 'package:e_commerce_app/bloc/category/category_bloc.dart';
import 'package:e_commerce_app/bloc/product/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
            if (state is CategoryLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is CategoryLoadedState) {
              return CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 1.5,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
                items: state.categories.map((category) {
                  return HeroCarouselCardWidget(categoryModel: category);
                }).toList(),
              );
            }

            return const Center(
              child: Text("Something went wrong!"),
            );
          }),
          const SectionTitleWidget(title: "RECOMMENDED"),
          BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
            if (state is ProductLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ProductLoadedState) {
              return ProductCarouselWidget(
                products: state.products
                    .where((product) => product.isRecommended)
                    .toList(),
              );
            }

            return const Center(
              child: Text("Something went wrong!"),
            );
          }),
          const SectionTitleWidget(title: "MOST POPULAR"),
          BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
            if (state is ProductLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ProductLoadedState) {
              return ProductCarouselWidget(
                products: state.products
                    .where((product) => product.isPopular)
                    .toList(),
              );
            }

            return const Center(
              child: Text("Something went wrong!"),
            );
          })
        ],
      ),
    );
  }
}
