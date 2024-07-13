import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          return Center(child: CircularProgressIndicator());
        } else if (state is HomeFaliure) {
          return Center(child: Text('Failed to load products'));
        } else if (state is HomeSuccess) {
          // Assuming `state.home.products` is the list of products
          final products = state.home.products;
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 32.w,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns
                childAspectRatio: 0.75, // Adjust aspect ratio as needed
                crossAxisSpacing: 16.w, // Space between columns
                mainAxisSpacing: 16.h, // Space between rows
              ),
              itemCount: state.home.products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(
                  price: state.home.products[index].price.toString(),
                  name: state.home.products[index].name,
                  image: state.home.products[index].image,
                );
              },
            ),
          );
        } else {
          // Default view if no state matches
          return Center(child: Text('No products available'));
        }
      },
    );
  }
}