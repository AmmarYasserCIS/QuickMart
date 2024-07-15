import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickmart/core/networking/dio_consumer.dart';
import 'package:quickmart/core/theming/Styles.dart'; // Adjust import paths as necessary
import 'package:quickmart/core/theming/colors.dart';
import 'package:quickmart/features/home/Data/Cubit/categories_cubit.dart';
import 'package:quickmart/features/home/Data/Cubit/home_cubit.dart';
import 'package:quickmart/features/home/ui/widgets/categories.dart';
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
    context.read<HomeCubit>().getHomeData();
    context.read<CategoriesCubit>().getCategoryData(); // Fetch home data on init
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
        BlocProvider(
          create: (context) =>
          CategoriesCubit(DioConsumer(dio: Dio()))
            ..getCategoryData(),
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
                  //HomeBanners(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        'https://static.vecteezy.com/system/resources/thumbnails/018/943/054/small_2x/3d-banner-realistic-accessories-for-mobile-game-console-controller-headphones-joystick-smart-watches-illustration-vector.jpg',
                        width: 320.w, // Adjust width as needed
                        fit: BoxFit.cover, // Ensure the image covers the rounded rectangle
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'Categories',
                    style: TextStyles.font24BlackBold,
                  ),
                  SizedBox(height: 16.h),
                  CategoriesBuilder(),


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
