import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickmart/core/widgets/products_builder.dart';
import 'package:quickmart/features/category_products/data/cubit/category_products_cubit.dart';
import 'package:quickmart/features/home/Data/Cubit/categories_cubit.dart';

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
          return Center(child: CircularProgressIndicator());
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
