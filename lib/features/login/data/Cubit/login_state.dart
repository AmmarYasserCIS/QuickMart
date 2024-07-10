part of 'login_cubit.dart';

@immutable
 class LoginState {}

class LoginInitial extends LoginState {}
class SignInSuccess extends LoginState {
}
class SignInLoading extends LoginState {}
class SignInFalure extends LoginState {
  final String errorMessage;
  SignInFalure({required this.errorMessage});
}
