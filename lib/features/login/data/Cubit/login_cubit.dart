import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();

  Future<void> signIn() async {
    if (!signInFormKey.currentState!.validate()) {
      return;
    }

    try {
      emit(SignInLoading());
      final response = await Dio().post(
        'https://student.valuxapps.com/api/login',
        data: {
          'email': signInEmail.text,
          'password': signInPassword.text,
        },
      );

      // Check if the response is successful
      if (response.statusCode == 200 && response.data['status'] == true) {
        emit(SignInSuccess(SucessMessage: response.data['message'] ?? 'Login Success'));
      } else {
        emit(SignInFalure(errorMessage: response.data['message'] ?? 'Login failed'));
      }
    } catch (e) {
      emit(SignInFalure(errorMessage: e.toString()));
    }
  }
}
