part of 'checkout_cubit.dart';

@immutable
abstract class CheckoutState {}

class CheckoutInitial extends CheckoutState {}

class CheckoutLoading extends CheckoutState {}

class CheckoutSuccess extends CheckoutState {
  final CheckoutUrlModel checkourmodel;

  CheckoutSuccess({required this.checkourmodel});
}

class CheckoutFailure extends CheckoutState {
  final String errorMessage;

  CheckoutFailure({required this.errorMessage});
}
