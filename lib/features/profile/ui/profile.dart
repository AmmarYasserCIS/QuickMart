import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickmart/core/theming/colors.dart';
import 'package:quickmart/features/profile/ui/widgets/profile_header.dart';
import 'package:quickmart/features/profile/ui/widgets/profile_tiles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top section with cyan background
          Container(
            height: 200.h,
            color: ColorsManager.mainCyan,
          ),
          // Bottom section with white background
          Container(
            margin: EdgeInsets.only(top: 180.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
          ),
          SafeArea(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // Profile header
                ProfileHeader(),
                SizedBox(height: 16.h),

                // Container for the rest of the content with border radius
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                  padding: EdgeInsets.all(16.w),
                  child: ProfileTiles()
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
