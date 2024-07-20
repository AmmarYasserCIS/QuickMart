import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickmart/core/networking/dio_consumer.dart';
import 'package:quickmart/core/theming/Styles.dart';
import 'package:quickmart/features/cart/data/cubit/cart_products_cubit.dart';
import 'package:quickmart/features/cart/ui/widgets/cart_products.dart';
import 'package:quickmart/features/home/Data/Cubit/categories_cubit.dart';
import 'package:quickmart/features/home/Data/Cubit/home_cubit.dart';
import 'package:quickmart/features/home/ui/widgets/categories.dart';
import 'package:quickmart/features/home/ui/widgets/home_screen_header.dart';
import 'package:quickmart/features/home/ui/widgets/home_productsBuilder.dart';
import 'package:quickmart/features/wishlist/data/cubti/wishlist_cubit.dart';

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
    context.read<CategoriesCubit>().getCategoryData();
    context.read<CartProductsCubit>().getCartData();
    context.read<WishlistCubit>().getWishlistData();
    // Fetch home data on init
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
                        width: 320.w,
                        fit: BoxFit.cover,
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
