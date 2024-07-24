import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickmart/core/theming/Styles.dart';
import 'package:quickmart/core/widgets/app_circular_indecator.dart';
import 'package:quickmart/core/widgets/app_text_button.dart';
import 'package:quickmart/features/cart/ui/widgets/cart_shimmer_builder.dart';
import 'package:quickmart/features/wishlist/data/cubti/wishlist_cubit.dart';
import 'package:quickmart/features/wishlist/ui/widgets/wishlist_products.dart';

class WishlistScreen extends StatelessWidget {
   WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistCubit, WishlistState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is WishlistLoading) {
          return Scaffold(
            appBar: AppBar(automaticallyImplyLeading: false,forceMaterialTransparency: true,title: Text('Wishlist'), centerTitle: true,actions: [IconButton(onPressed: () {
              context.read<WishlistCubit>().getWishlistData();
            },icon: Icon(Icons.refresh)),SizedBox(width: 10.w,)]),
            body:CartShimmerBuilder(),
          );;
        } else if (state is WishlistFailure) {
          return Scaffold(
            appBar: AppBar(automaticallyImplyLeading: false,forceMaterialTransparency: true,title: Text('Wishlist'), centerTitle: true,actions: [IconButton(onPressed: () {
              context.read<WishlistCubit>().getWishlistData();
            },icon: Icon(Icons.refresh)),SizedBox(width: 10.w,)]),
            body: Center(child: Text('Failed to load products')),
          );
        } else if (state is WishlistSuccess) {
          final products = state.wishlist.data;
          return Scaffold(
              appBar: AppBar(automaticallyImplyLeading: false,title: Text('Wishlist'), centerTitle: true,actions: [IconButton(onPressed: () {
                context.read<WishlistCubit>().getWishlistData();
              },icon: Icon(Icons.refresh)),SizedBox(width: 10.w,)]),
              body: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return WishlistProducts(
                            name: products[index].title,
                            image: products[index].imageCover,
                            price: products[index].price, id:products[index].id,
                          );
                        },
                      ),
                    ),

                  ],
                ),
              ));
        }
         else {
          return Scaffold( appBar: AppBar(automaticallyImplyLeading: false,title: Text('Wishlist'), forceMaterialTransparency: true,centerTitle: true,actions: [IconButton(onPressed: () {
            context.read<WishlistCubit>().getWishlistData();
          },icon: Icon(Icons.refresh)),SizedBox(width: 10.w,)]),
              body: Center(child: Text('No products available')));
        }
      },
    );
  }
}
