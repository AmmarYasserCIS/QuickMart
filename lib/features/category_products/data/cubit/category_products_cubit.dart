import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quickmart/core/errors/exceptions.dart';
import 'package:quickmart/core/networking/APIConsumer.dart';
import 'package:quickmart/core/networking/end_points.dart';
import 'package:quickmart/features/home/Data/Model/home_model.dart';

part 'category_products_state.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  CategoryProductsCubit(this.api) : super(CategoryProductsInitial());
  final ApiConsumer api;


  Future<void> getProductsData(String categoryValue) async {
    final queryParameters = {
      'category[in]': categoryValue, // Replace with actual value
    };

    try {
      emit(CategoryProductsLoading());
      final response = await api.get(EndPoint.products,queryParameters: queryParameters);
      final ProductsData = HomeModel.fromJson(response.data);
      log(ProductsData.toString());
      emit(CategoryProductsSuccess(categoryProcducts: ProductsData));
    } on ServerException catch (e) {
      emit(CategoryProductsFaliure(errorMessage: e.errModel.errorMessage));
    }
  }
}
