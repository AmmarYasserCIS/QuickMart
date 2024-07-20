import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickmart/core/theming/Styles.dart';
import 'package:quickmart/features/cart/data/cubit/cart_products_cubit.dart';
import 'package:quickmart/features/wishlist/data/cubti/wishlist_cubit.dart';

class WishlistProducts extends StatefulWidget {
  WishlistProducts({
    Key? key,
    required this.name,
    required this.image,
    required this.price,
    required this.id,

  }) : super(key: key);

  final String name;
  final String image;
  final double price;
  final String id;


  @override
  _WishlistProductsState createState() => _WishlistProductsState();
}

class _WishlistProductsState extends State<WishlistProducts> {


  @override


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Image.network(
              widget.image,
              width: 120.w,
              height: 120.h,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyles.font14BlackSemiBold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Text(
                      '${widget.price}',
                      style: TextStyles.font14BlackSemiBold,
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        context.read<WishlistCubit>().deleteWishlistItem(widget.id);
                      },
                      child: SvgPicture.asset('assets/svgs/trash.svg'),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
