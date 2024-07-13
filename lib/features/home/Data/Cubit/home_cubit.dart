import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quickmart/core/errors/exceptions.dart';
import 'package:quickmart/core/networking/APIConsumer.dart';
import 'package:quickmart/core/networking/end_points.dart';
import 'package:quickmart/features/home/Data/Model/home_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.api) : super(HomeInitial());
  final ApiConsumer api;

  Future<void> getHomeData() async {
    try {
      emit(HomeLoading());
      final response = await api.get(EndPoint.home);
      final homeData = HomeModel.fromJson(response.data);
      log(homeData.toString());
      emit(HomeSuccess(home: homeData));
    } on ServerException catch (e) {
      emit(HomeFaliure(errorMessage: e.errModel.errorMessage));
    }
  }
}
