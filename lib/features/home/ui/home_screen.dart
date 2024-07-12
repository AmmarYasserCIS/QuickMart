import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickmart/core/theming/Styles.dart'; // Adjust import paths as necessary
import 'package:quickmart/core/theming/colors.dart';
import 'package:quickmart/features/home/ui/widgets/home_screen_banners.dart';
import 'package:quickmart/features/home/ui/widgets/home_screen_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: HomeScreenHeader(),
                ),
                SizedBox(height: 24.h),
                HomeBanners(),
                SizedBox(height: 24.h),
                Text(
                  'Categories',
                  style: TextStyles.font24BlackBold,
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 40.h, // Adjust the height as needed
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Container(
                          width: 100.w,
                          // Adjust the width as needed
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: ColorsManager.gray.withOpacity(0.2))),
                          // Add a background color
                          child: Center(
                            child: Text(
                              'data',
                              style: TextStyles.font14BlackSemiBold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
