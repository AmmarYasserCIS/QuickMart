part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeSuccess extends HomeState {
  final HomeModel home;
  HomeSuccess({required this.home});
}
class HomeFaliure extends HomeState {
  final String errorMessage;
  HomeFaliure({required this.errorMessage});
}
