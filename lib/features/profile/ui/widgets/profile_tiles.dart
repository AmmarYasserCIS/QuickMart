import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quickmart/core/theming/Styles.dart';
import 'package:quickmart/core/widgets/app_tile.dart';

class ProfileTiles extends StatelessWidget {
  const ProfileTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Personal Information section
        Text(
          'Personal Information',
          style: TextStyles.font16BlackBold,
        ),
        AppTile(
          title: 'Shipping Address',
          onTap: () {},
          leading: SvgPicture.asset('assets/svgs/box.svg',width: 32.w,
            height: 32.h,),
        ),
        AppTile(
          leading: SvgPicture.asset(
            'assets/svgs/payment.svg',width: 32.w,
              height: 32.h,
          ),
          title: 'Payment Method',
          onTap: () {},
        ),
        AppTile(
          leading: SvgPicture.asset('assets/svgs/order_history.svg',width: 32.w,
            height: 32.h,),
          title: 'Order History',
          onTap: () {},
        ),
        Divider(),

        // Support & Information section
        Text(
          'Support & Information',
          style: TextStyles.font16BlackBold,
        ),
        AppTile(
          leading: SvgPicture.asset(
            'assets/svgs/shield.svg',
            width: 32.w,
            height: 32.h,
          ),
          title: 'Privacy Policy',
          onTap: () {},
        ),
        AppTile(
          leading: SvgPicture.asset('assets/svgs/terms.svg',width: 32.w,
            height: 32.h,),
          title: 'Terms & Conditions',
          onTap: () {},
        ),
        AppTile(
          leading: SvgPicture.asset('assets/svgs/faq.svg',width: 32.w,
            height: 32.h,),
          title: 'FAQs',
          onTap: () {},
        ),
        Divider(),

        // Account Management section
        Text(
          'Account Management',
          style: TextStyles.font16BlackBold,
        ),
        AppTile(
          leading: SvgPicture.asset('assets/svgs/password.svg',width: 32.w,
            height: 32.h,),
          title: 'Change Password',
          onTap: () {},
        ),
      ],
    );
  }
}
