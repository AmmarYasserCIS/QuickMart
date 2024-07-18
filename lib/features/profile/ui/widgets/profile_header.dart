import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickmart/core/cache/cache_helper.dart';
import 'package:quickmart/core/networking/end_points.dart';
import 'package:quickmart/core/theming/Styles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40.0.r,
            backgroundImage: NetworkImage('https://i0.wp.com/icon-library.com/images/no-profile-picture-icon/no-profile-picture-icon-18.jpg'),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${CacheHelper().getData(key: ApiKey.userName)}',
                style: TextStyles.font24WhiteBold,
              ),
              SizedBox(height: 4.h),
              Text(
                '${CacheHelper().getData(key: ApiKey.userEmail)}',
                style: TextStyles.font16WhiteMedium,
              ),
            ],
          ),
          Spacer(),
          SvgPicture.asset('assets/svgs/logout.svg',width: 32.w,height: 32.h,)
        ],
      ),
    );
  }
}
