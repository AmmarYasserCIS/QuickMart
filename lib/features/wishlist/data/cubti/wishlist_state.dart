part of 'wishlist_cubit.dart';

@immutable
abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistSuccess extends WishlistState {
  final WishlistModel wishlist;

  WishlistSuccess({required this.wishlist});
}

class WishlistFailure extends WishlistState {
  final String errorMessage;

  WishlistFailure({required this.errorMessage});
}

class AddWishlistLoading extends WishlistState {}

class AddWishlistSuccess extends WishlistState {}

class AddWishlistFailure extends WishlistState {
  final String errorMessage;

  AddWishlistFailure({required this.errorMessage});
}

class DeleteWishlistSuccess extends WishlistState {}
