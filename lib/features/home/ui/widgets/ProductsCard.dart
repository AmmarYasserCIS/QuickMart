import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickmart/core/theming/Styles.dart';

class ProductCard extends StatefulWidget {
  final String name;
  final double price;
  final String image;

  ProductCard({
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxHeight: 140.h,
                  ),
                  child: Image.network(
                    widget.image,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(width: 32,height: 32,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(size: 20,
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            widget.name,
            style: TextStyles.font14BlackSemiBold.copyWith(
              overflow: TextOverflow.ellipsis,

            ),
          ),
          SizedBox(height: 4.h),
          Text(
            "${widget.price} EGP",
            style: TextStyles.font14BlackSemiBold.copyWith(
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}