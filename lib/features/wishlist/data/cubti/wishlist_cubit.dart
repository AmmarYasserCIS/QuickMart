import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:quickmart/core/errors/exceptions.dart';
import 'package:quickmart/core/networking/APIConsumer.dart';
import 'package:quickmart/core/networking/end_points.dart';
import 'package:quickmart/features/wishlist/data/model/wishlist_model.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit(this.api) : super(WishlistInitial());
  final ApiConsumer api;

  Future<void> getWishlistData() async {
    try {
      emit(WishlistLoading());
      final response = await api.get(EndPoint.wishlist);
      final wishlistData = WishlistModel.fromJson(response.data);
      log(wishlistData.toString());
      if (response.data['status'] == "success") {
        emit(WishlistSuccess(wishlist: wishlistData));
      }
    } on ServerException catch (e) {
      emit(WishlistFailure(errorMessage: e.errModel.errorMessage));
    }
  }

  Future<void> addWishlist(String productId) async {
    try {
      emit(AddWishlistLoading());
      final response = await api.post(
        EndPoint.wishlist,
        data: {
          ApiKey.productId: productId
        },
        isFromData: false,
      );

      if (response.data['status'] == "success") {
        emit(AddWishlistSuccess());
      } else {
        emit(AddWishlistFailure(errorMessage: response.data['message'] ?? 'Unknown error occurred'));
      }
    } on DioException catch (e) {
      emit(AddWishlistFailure(errorMessage: e.response?.data['message'] ?? e.toString()));
    } catch (e) {
      emit(AddWishlistFailure(errorMessage: e.toString()));
    }
  }

  Future<void> deleteWishlistItem(String id) async {
    try {
      await api.delete(EndPoint.DeleteWishlistitem(id));
      emit(DeleteWishlistSuccess());
      await getWishlistData();
    } catch (e) {
      // Handle the error appropriately
      log(e.toString());
    }
  }
}
