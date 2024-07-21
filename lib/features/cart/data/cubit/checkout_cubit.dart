import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:quickmart/core/networking/APIConsumer.dart';
import 'package:quickmart/core/networking/end_points.dart';
import 'package:quickmart/features/cart/data/model/checkout_model.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.api) : super(CheckoutInitial());
  final ApiConsumer api;

  GlobalKey<FormState> checkoutFormKey = GlobalKey<FormState>();
  TextEditingController checkoutCity = TextEditingController();
  TextEditingController checkoutPhone = TextEditingController();
  TextEditingController checkoutDetails = TextEditingController();

  Future<void> checkout(id) async {
    try {
      emit(CheckoutLoading());
      final response = await api.post(EndPoint.Checkout(id), data: {
        "shippingAddress": {
          "details": checkoutDetails.text,
          "phone": checkoutPhone.text,
          "city": checkoutCity.text
        }
      }, isFromData: false);
      final url = CheckoutUrlModel.fromJson(response.data);

      if (response.data['status'] == "success") {
        emit(CheckoutSuccess(checkourmodel: url));
      } else {
        emit(CheckoutFailure(errorMessage: response.data['message'] ?? 'Unknown error occurred'));
      }
    } on DioException catch (e) {
      emit(CheckoutFailure(errorMessage: e.response?.data['message'] ?? e.toString()));
    } catch (e) {
      emit(CheckoutFailure(errorMessage: e.toString()));
    }
  }
}
