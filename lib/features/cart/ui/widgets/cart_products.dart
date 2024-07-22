import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickmart/core/theming/Styles.dart';
import 'package:quickmart/features/cart/data/cubit/cart_products_cubit.dart';

class CartProducts extends StatefulWidget {
  CartProducts({
    Key? key,
    required this.name,
    required this.image,
    required this.price,
    required this.id,
    required this.count,
  }) : super(key: key);

  final String name;
  final String image;
  final int price;
  final String id;
  final int count;

  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  late int _count;

  @override
  void initState() {
    super.initState();
    _count = widget.count;
  }

  void increaseQuantity() {
    setState(() {
      _count++;
      context.read<CartProductsCubit>().updateCartItemCount(widget.id, _count);
    });
  }

  void decreaseQuantity() {
    setState(() {
      if (_count > 1) {
        _count--;
        context.read<CartProductsCubit>().updateCartItemCount(widget.id, _count);
      }
    });
  }

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
                Text(
                  '${widget.price}',
                  style: TextStyles.font14BlackSemiBold,
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    IntrinsicWidth(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: decreaseQuantity,
                              icon: Icon(Icons.remove),
                            ),
                            Text(
                              '$_count',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            IconButton(
                              onPressed: increaseQuantity,
                              icon: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        context.read<CartProductsCubit>().deleteCartItem(widget.id);
                      },
                      child: SvgPicture.asset('assets/svgs/trash.svg'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
