part of 'category_products_cubit.dart';

@immutable
abstract class CategoryProductsState {}

class CategoryProductsInitial extends CategoryProductsState {}
class CategoryProductsLoading extends CategoryProductsState {}
class CategoryProductsSuccess extends CategoryProductsState {
  final HomeModel categoryProcducts;
  CategoryProductsSuccess({required this.categoryProcducts});
}
class CategoryProductsFaliure extends CategoryProductsState {
  final String errorMessage;
  CategoryProductsFaliure({required this.errorMessage});
}
