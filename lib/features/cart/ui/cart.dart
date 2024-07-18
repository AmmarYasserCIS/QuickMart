import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickmart/core/theming/Styles.dart';
import 'package:quickmart/core/widgets/app_text_button.dart';
import 'package:quickmart/features/cart/data/cubit/cart_products_cubit.dart';
import 'package:quickmart/features/cart/ui/widgets/cart_products.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartProductsCubit, CartProductsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is CartProductsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CartProductsFaliure) {
          return Center(child: Text('Failed to load products'));
        } else if (state is CartProductsSuccess) {
          final products = state.cart.data;
          return Scaffold(
              appBar: AppBar(title: Text('My Cart'), centerTitle: true),
              body: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: products.products.length,
                        itemBuilder: (context, index) {
                          return CartProducts(
                            name: products.products[index].product.title,
                            image: products.products[index].product.imageCover,
                            price: products.products[index].price,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order Info',
                            style: TextStyles.font20BlackBold,
                          ),
                          SizedBox(height: 16.h,),
                          Row(
                            children: [
                              Text(
                                'Subtotal',
                                style: TextStyles.font18GrayRegular,
                              ),
                              Spacer(),
                              Text(
                                '${products.totalCartPrice} EGP',
                                style: TextStyles.font18GrayRegular,
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h,),
                          Row(
                            children: [
                              Text(
                                'Shipping Cost',
                                style: TextStyles.font18GrayRegular,
                              ),
                              Spacer(),
                              Text(
                                '0.00',
                                style: TextStyles.font18GrayRegular,
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h,),
                          Row(
                            children: [
                              Text(
                                'Total',
                                style: TextStyles.font20BlackBold,
                              ),
                              Spacer(),
                              Text(
                                '${products.totalCartPrice} EGP',
                                style: TextStyles.font20BlackBold,
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h,),
                          AppTextButton(
                            borderRadius: 12,
                            backgroundColor: Colors.black,
                            buttonText: 'Checkout(${products.products.length})',
                            textStyle: TextStyles.font14BlackSemiBold.copyWith(
                              color: Colors.white,
                              fontSize: 13.sp
                            ),
                            onPressed: () {
                              ;
                            },
                          ),
                          SizedBox(height: 16.h,),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        }
        else if (state is CartProductsEmpty) {
          return Center(child: Text('Failed to load products'));
        } else {
          return Center(child: Text('No products available'));
        }
      },
    );
  }
}
