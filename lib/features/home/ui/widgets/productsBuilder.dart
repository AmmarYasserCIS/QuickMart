  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            return Center(child: CircularProgressIndicator());
          } else if (state is HomeFaliure) {
            return Center(child: Text('Failed to load products'));
          } else if (state is HomeSuccess) {
            final products = state.home.data;
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
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailedProduct(
                            images: product.images,
                            name: product.title, // Change 'name' to 'title'
                            price: product.price,
                            id: product.id,
                            description: product.description,
                             // Adjust as necessary
                          ),
                        ),
                      );
                    },
                    child: ProductCard(
                      price: product.price.toString(),
                      name: product.title, // Change 'name' to 'title'
                      image: product.imageCover, // Use imageCover for the product image
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(child: Text('No products available'));
          }
        },
      );
    }
  }
