import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickmart/core/networking/dio_consumer.dart';
import 'package:quickmart/core/theming/Styles.dart'; // Adjust import paths as necessary
import 'package:quickmart/core/theming/colors.dart';
import 'package:quickmart/features/home/Data/Cubit/home_cubit.dart';
import 'package:quickmart/features/home/ui/widgets/home_screen_banners.dart';
import 'package:quickmart/features/home/ui/widgets/home_screen_header.dart';
import 'package:quickmart/features/home/ui/widgets/productsBuilder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getHomeData(); // Fetch home data on init
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          HomeCubit(DioConsumer(dio: Dio()))
            ..getHomeData(),
        ),
      ],
      child: Scaffold(
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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: ColorsManager.gray.withOpacity(0.2),
                              ),
                            ),
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
                  SizedBox(height: 24.h),
                  Text(
                    'Latest Products',
                    style: TextStyles.font24BlackBold,
                  ),
                  SizedBox(height: 16.h),
                  Products(),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
