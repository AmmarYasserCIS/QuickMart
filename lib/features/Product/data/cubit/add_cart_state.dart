part of 'add_cart_cubit.dart';

@immutable
abstract class AddCartState {}

class AddCartInitial extends AddCartState {}
class AddCartLoading extends AddCartState {}
class AddCartSuccess extends AddCartState {}
class AddCartFaliure extends AddCartState {
  final String errorMessage;
  AddCartFaliure({required this.errorMessage});
}
