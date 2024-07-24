import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickmart/features/cart/data/cubit/cart_products_cubit.dart';
import 'package:provider/provider.dart';

class CartAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('My Cart'),
      forceMaterialTransparency: true,
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            context.read<CartProductsCubit>().getCartData();
          },
          icon: Icon(Icons.refresh),
        ),
        SizedBox(width: 10.w),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
