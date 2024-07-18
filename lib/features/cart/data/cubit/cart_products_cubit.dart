import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quickmart/core/errors/exceptions.dart';
import 'package:quickmart/core/networking/APIConsumer.dart';
import 'package:quickmart/core/networking/end_points.dart';
import 'package:quickmart/features/cart/data/model/cart_products_model.dart';

part 'cart_products_state.dart';

class CartProductsCubit extends Cubit<CartProductsState> {
  CartProductsCubit(this.api) : super(CartProductsInitial());
  final ApiConsumer api;

  Future<void> getCartData() async {
    try {
      emit(CartProductsLoading());
      final response = await api.get(EndPoint.cart);
      final cartData = CartResponse.fromJson(response.data);
      log(cartData.toString());
      if (response.data['status'] == "success") {
        emit(CartProductsSuccess(cart: cartData));
      } else if (response.data['statusMsg'] == "fail") {
        emit(CartProductsEmpty());
      }
    } on ServerException catch (e) {
      emit(CartProductsFaliure(errorMessage: e.errModel.errorMessage));
    }
  }

  Future<void> deleteCartItem(String id) async {
    try {
      await api.delete(EndPoint.DeleteCartitem(id));
      await getCartData();
    } catch (e) {
      // Handle the error appropriately
      log(e.toString());
    }
  }

  Future<void> updateCartItemCount(String id, int count) async {
    try {
      await api.put(EndPoint.DeleteCartitem(id), data: {"count": count});
      await getCartData();
    } catch (e) {
      // Handle the error appropriately
      log(e.toString());
    }
  }
}
