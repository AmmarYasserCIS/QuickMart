import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quickmart/core/cache/cache_helper.dart';
import 'package:quickmart/core/networking/end_points.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        SvgPicture.asset(
          'assets/svgs/quickmartLogo.svg',
          width: 104.w,
          height: 32.h,
        ),
        Spacer(),
        Icon(
          Icons.search,
          size: 32,
        ),
        SizedBox(width: 8.w), // Add some spacing between the icon and the profile image
        ClipRRect(borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 32.w,
            height: 32.h,
            child: Image.network(
              'https://i0.wp.com/icon-library.com/images/no-profile-picture-icon/no-profile-picture-icon-18.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
