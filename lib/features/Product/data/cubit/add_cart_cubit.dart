import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:quickmart/core/networking/APIConsumer.dart';
import 'package:quickmart/core/networking/end_points.dart';

part 'add_cart_state.dart';

class AddCartCubit extends Cubit<AddCartState> {
  AddCartCubit(this.api) : super(AddCartInitial());
  final ApiConsumer api;
  Future<void> AddCart(String productId) async {
    try {
      emit(AddCartLoading());
      final response = await api.post(EndPoint.cart, data: {
        ApiKey.productId: productId

      }, isFromData: false);

      if (response.data['status'] == "success") {
        emit(AddCartSuccess());
      } else {
        emit(AddCartFaliure(errorMessage: response.data['message'] ?? 'Unknown error occurred'));
      }
      return response;
    } on DioException catch (e) {
      emit(AddCartFaliure(errorMessage: e.response?.data['message'] ?? e.toString()));
    } catch (e) {
      emit(AddCartFaliure(errorMessage: e.toString()));
    }
  }

}
