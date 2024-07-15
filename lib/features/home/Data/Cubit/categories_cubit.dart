import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quickmart/core/errors/exceptions.dart';
import 'package:quickmart/core/networking/APIConsumer.dart';
import 'package:quickmart/core/networking/end_points.dart';
import 'package:quickmart/features/home/Data/Model/category_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.api) : super(CategoriesInitial());

  final ApiConsumer api;

  Future<void> getCategoryData() async {
    try {
      emit(CategoriesLoading());
      final response = await api.get(EndPoint.category);
      final categories = Categories.fromJson(response.data);
      log(categories.toString());
      emit(CategoriesSuccess(categories: categories));
    } on ServerException catch (e) {
      emit(CategoriesFaliure(errorMessage: e.errModel.errorMessage));
    }
  }
}
