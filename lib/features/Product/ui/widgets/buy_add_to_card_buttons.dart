import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickmart/core/theming/Styles.dart';
import 'package:quickmart/core/widgets/app_text_button.dart';

class BuyBowButtons extends StatelessWidget {
  const BuyBowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: AppTextButton(
            borderSideColor: Colors.grey.withOpacity(0.4),
            borderRadius: 12,
            backgroundColor: Colors.white,
            buttonText: 'Buy now',
            textStyle: TextStyles.font14BlackSemiBold,
            onPressed: () {},
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: AppTextButton(
            borderRadius: 12,
            backgroundColor: Colors.black,
            buttonText: 'Add To Cart',
            textStyle: TextStyles.font14BlackSemiBold.copyWith(
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
