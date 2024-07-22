import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickmart/core/widgets/app_circular_indecator.dart';
import 'package:quickmart/core/widgets/products_builder.dart';
import 'package:quickmart/features/Product/ui/product.dart';
import 'package:quickmart/features/home/Data/Cubit/home_cubit.dart';
import 'package:quickmart/features/home/ui/widgets/ProductsCard.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeFaliure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        if (state is HomeLoading) {
          return Center(child: Loading());
        } else if (state is HomeFaliure) {
          return Center(child: Text('Failed to load products'));
        } else if (state is HomeSuccess) {
          final products = state.home.data;
          return ProductsBuilder(
            itemCount: products.length,
            getName: (index) => products[index].title,
            getPrice: (index) => products[index].price,
            getImage: (index) => products[index].imageCover,
            getImages: (index) => products[index].images,
            getId: (index) => products[index].id,
            getDescription: (index) => products[index].description,
            ratingsAverage: (index) => products[index].ratingsAverage,
          );
        } else {
          return Center(child: Text('No products available'));
        }
      },
    );
  }
}
