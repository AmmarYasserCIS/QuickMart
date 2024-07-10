import 'package:dio/dio.dart';
import 'package:quickmart/core/networking/end_points.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['lang']='en';
    super.onRequest(options, handler);
  }
}