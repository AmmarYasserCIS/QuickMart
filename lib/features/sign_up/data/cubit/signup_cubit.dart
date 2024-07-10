import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:quickmart/core/networking/APIConsumer.dart';
import 'package:quickmart/core/networking/end_points.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.api) : super(SignupInitial());
  final ApiConsumer api;
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  TextEditingController signupEmail = TextEditingController();
  TextEditingController signupPassword = TextEditingController();
  TextEditingController signupName = TextEditingController();
  TextEditingController signupPhone = TextEditingController();

  Future<void> signUp() async {

    try {
      emit(SignUpLoading());
      final response = await api.post(EndPoint.signUp, data: {
        ApiKey.email: signupEmail.text,
        ApiKey.password:signupPassword.text,
        ApiKey.name:signupName.text,
        ApiKey.phone:signupPhone.text


      },isFromData: true);
      emit(SignUpSuccess());
      return response;
    } on Exception catch (e) {
      emit(SignUpFalure(errorMessage: e.toString()));
    }
  }

}
