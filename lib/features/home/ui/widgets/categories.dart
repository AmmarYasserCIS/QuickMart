import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickmart/core/networking/dio_consumer.dart';
import 'package:quickmart/core/theming/Styles.dart';
import 'package:quickmart/core/theming/colors.dart';
import 'package:quickmart/core/widgets/app_circular_indecator.dart';
import 'package:quickmart/features/category_products/data/cubit/category_products_cubit.dart';
import 'package:quickmart/features/category_products/ui/category_Products.dart';
import 'package:quickmart/features/home/Data/Cubit/categories_cubit.dart';

class CategoriesBuilder extends StatelessWidget {
  const CategoriesBuilder({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit, CategoriesState>(
      listener: (context, state) {
        if (state is CategoriesFaliure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return Center(child: Loading());
        } else if (state is CategoriesSuccess) {
          final categories = state.categories.data;

          if (categories.isEmpty) {
            return Center(child: Text('No categories available'));
          }

          return ConstrainedBox(constraints: BoxConstraints(maxHeight: 50.h),
            child: ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final category = categories[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => CategoryProductsCubit(DioConsumer(dio: Dio())),
                          child: CategoryProductsScreen(categoryValue: category.id, categoryName: category.name,),
                        ),
                      ),
                    );

                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: IntrinsicWidth(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: ColorsManager.gray.withOpacity(0.2),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 8.h),
                          child: Text(
                            category.name,
                            style: TextStyles.font14BlackSemiBold.copyWith(),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is CategoriesFaliure) {
          return Center(child: Text('Failed to load categories'));
        } else {
          return Center(child: Text('Loading categories...'));
        }
      },
    );
  }
}
