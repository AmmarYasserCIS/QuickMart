part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}
class SignUpSuccess extends SignupState {
}
class SignUpLoading extends SignupState {}
class SignUpFalure extends SignupState {
  final String errorMessage;
  SignUpFalure({required this.errorMessage});
}
