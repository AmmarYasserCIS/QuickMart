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
      if (response.data['status'] == true) {
        emit(SignUpSuccess());
      }
      else {
        emit(SignUpFalure(errorMessage: response.data['message'] ?? 'Unknown error occurred'));
      }
      return response;
    }  on DioException catch (e) {
      emit(SignUpFalure(errorMessage: e.response?.data['message'] ?? e.toString()));
    } catch (e) {
      emit(SignUpFalure(errorMessage: e.toString()));
    }
    }
  }

