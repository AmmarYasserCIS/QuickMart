import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickmart/core/cache/cache_helper.dart';
import 'package:quickmart/core/networking/dio_consumer.dart';
import 'package:quickmart/features/Product/ui/product.dart';
import 'package:quickmart/features/cart/data/cubit/cart_products_cubit.dart';
import 'package:quickmart/features/cart/data/cubit/checkout_cubit.dart';
import 'package:quickmart/features/category_products/data/cubit/category_products_cubit.dart';
import 'package:quickmart/features/home/Data/Cubit/categories_cubit.dart';
import 'package:quickmart/features/login/data/Cubit/login_cubit.dart';
import 'package:quickmart/features/home/Data/Cubit/home_cubit.dart';
import 'package:quickmart/features/login/ui/login_screen.dart';
import 'package:quickmart/features/onBoarding/onboarding.dart';
import 'package:quickmart/features/wishlist/data/cubti/wishlist_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(DioConsumer(dio: Dio())),
        ),
        BlocProvider(
          create: (context) => HomeCubit(DioConsumer(dio: Dio())),
        ),
        BlocProvider(
          create: (context) => CategoriesCubit(DioConsumer(dio: Dio())),
        ),
        BlocProvider(
          create: (context) => CategoryProductsCubit(DioConsumer(dio: Dio())),
        ),
        BlocProvider(
          create: (context) => CartProductsCubit(DioConsumer(dio: Dio())),
        ),
        BlocProvider(
          create: (context) => WishlistCubit(DioConsumer(dio: Dio())),
        ),
        BlocProvider(
          create: (context) => CheckoutCubit(DioConsumer(dio: Dio())),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'QuickMart',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,


          ),
          home: OnboardingScreen(),
        ),
      ),
    );
  }
}
