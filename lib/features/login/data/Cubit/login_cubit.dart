import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:quickmart/core/cache/cache_helper.dart';
import 'package:quickmart/core/networking/APIConsumer.dart';
import 'package:quickmart/core/networking/end_points.dart';
import 'package:quickmart/features/login/data/models/signIn_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.api) : super(LoginInitial());
  final ApiConsumer api;

  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();


  Future<void> signIn() async {
    try {
      emit(SignInLoading());
      final response = await api.post(EndPoint.signIn, data: {
        ApiKey.email: signInEmail.text,
        ApiKey.password: signInPassword.text,
      }, isFromData: false);

      if (response.data['message'] == "success") {

        CacheHelper().saveData(key: ApiKey.token, value: response.data['token']);
        CacheHelper().saveData(key: ApiKey.userName, value: response.data['user']['name']);
        CacheHelper().saveData(key: ApiKey.userEmail, value: response.data['user']['email']);


        emit(SignInSuccess());
      } else {
        emit(SignInFalure(errorMessage: response.data['message'] ?? 'Unknown error occurred'));
      }
      return response;
    } on DioException catch (e) {
      emit(SignInFalure(errorMessage: e.response?.data['message'] ?? e.toString()));
    } catch (e) {
      emit(SignInFalure(errorMessage: e.toString()));
    }
  }
}
