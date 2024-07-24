import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerCategoryWidget extends StatelessWidget {
  const ShimmerCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(constraints: BoxConstraints(maxHeight: 50.h),
      child: ListView(scrollDirection: Axis.horizontal,children: [Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: IntrinsicWidth(
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.2),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                child: Container(
                  width: 100.w, // Adjust width as needed
                  height: 20.h,  // Adjust height as needed
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: IntrinsicWidth(
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.2),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                child: Container(
                  width: 100.w, // Adjust width as needed
                  height: 20.h,  // Adjust height as needed
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: IntrinsicWidth(
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.2),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                child: Container(
                  width: 100.w, // Adjust width as needed
                  height: 20.h,  // Adjust height as needed
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      )],),
    );
  }
}
