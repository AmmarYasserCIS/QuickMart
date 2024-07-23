import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
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
  TextEditingController signupConfirmPassword = TextEditingController();
  TextEditingController signupName = TextEditingController();
  TextEditingController signupPhone = TextEditingController();

  Future<void> signUp() async {
    try {
      emit(SignUpLoading());
      final response = await api.post(EndPoint.signUp, data: {
        ApiKey.email: signupEmail.text,
        ApiKey.password: signupPassword.text,
        ApiKey.confirmpassword: signupConfirmPassword.text,
        ApiKey.name: signupName.text,
        ApiKey.phone: signupPhone.text
      }, isFromData: false);

      if (response.statusCode == 201) {
        emit(SignUpSuccess());
      } else if (response.statusCode == 400) {
        final errorMessage = response.data['errors']?['msg'] ?? 'Unknown error occurred';
        emit(SignUpFalure(errorMessage: errorMessage));
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['errors']?['msg'] ?? e.toString();
      emit(SignUpFalure(errorMessage: errorMessage));
    } catch (e) {
      emit(SignUpFalure(errorMessage: e.toString()));
    }
  }
}
