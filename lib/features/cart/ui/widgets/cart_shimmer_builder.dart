import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickmart/features/cart/ui/widgets/cart_shimmer.dart';

class CartShimmerBuilder extends StatelessWidget {
  const CartShimmerBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: [
        ShimmerProductCard(),
        SizedBox(height: 16.h),
        ShimmerProductCard(),
        SizedBox(height: 16.h),
        ShimmerProductCard(),
        SizedBox(height: 16.h),
        ShimmerProductCard(),
      ],
    );
  }
}
