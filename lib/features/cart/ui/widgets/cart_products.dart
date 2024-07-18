import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickmart/core/theming/Styles.dart';

class CartProducts extends StatefulWidget {
   CartProducts({Key? key, required this.name, required this.image, required this.price}) : super(key: key);
   final String name;
   final String image;
   final int price;


  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  int quantity = 1; // Initial quantity

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
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
              '${widget.image}',
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
                  '${widget.name}',
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
                              '$quantity',
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
                    SvgPicture.asset('assets/svgs/trash.svg')
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
