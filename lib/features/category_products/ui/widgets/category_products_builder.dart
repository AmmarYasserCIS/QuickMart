import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickmart/core/widgets/app_circular_indecator.dart';
import 'package:quickmart/core/widgets/products_builder.dart';
import 'package:quickmart/features/category_products/data/cubit/category_products_cubit.dart';
import 'package:quickmart/features/home/Data/Cubit/categories_cubit.dart';
import 'package:quickmart/features/home/ui/widgets/home_products_shimmer.dart';

class CategoryProductsBuilder extends StatefulWidget {
  const CategoryProductsBuilder({super.key});

  @override
  State<CategoryProductsBuilder> createState() => _CategoryProductsBuilderState();
}

class _CategoryProductsBuilderState extends State<CategoryProductsBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryProductsCubit, CategoryProductsState>(
      listener: (context, state) {
        if (state is CategoryProductsFaliure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        if (state is CategoryProductsLoading) {
          return Center(child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return ProductShimmer();
            },
          ),);
        } else if (state is CategoryProductsFaliure) {
          return Center(child: Text('Failed to load products'));
        } else if (state is CategoryProductsSuccess) {
          final products = state.categoryProcducts.data;
          return  ProductsBuilder(
            itemCount: products.length,
            getName: (index) => products[index].title,
            getPrice: (index) => products[index].price,
            getImage: (index) => products[index].imageCover,
            getImages: (index) => products[index].images,
            getId: (index) => products[index].id,
            getDescription: (index) => products[index].description, ratingsAverage: (index) => products[index].ratingsAverage,
          );
        } else {
          return Center(child: Text('No products available'));
        }
      },
    );
  }
}
