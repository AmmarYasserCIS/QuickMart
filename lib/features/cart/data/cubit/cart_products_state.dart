part of 'cart_products_cubit.dart';

@immutable
abstract class CartProductsState {}

class CartProductsInitial extends CartProductsState {}
class CartProductsLoading extends CartProductsState {}
class CartProductsEmpty extends CartProductsState {}
class CartProductsSuccess extends CartProductsState {
  final CartResponse cart;
  CartProductsSuccess({required this.cart});
}
class CartProductsFaliure extends CartProductsState {
  final String errorMessage;
  CartProductsFaliure({required this.errorMessage});
}
