part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}
class CategoriesLoading extends CategoriesState {}
class CategoriesSuccess extends CategoriesState {
  final Categories categories;
  CategoriesSuccess({required this.categories});
}
class CategoriesFaliure extends CategoriesState {
  final String errorMessage;
  CategoriesFaliure({required this.errorMessage});
}

