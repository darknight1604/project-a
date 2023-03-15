import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LogInterceptors extends Interceptor {
  var logger = Logger();
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    logger.i("API Request: onRequest uri", options.uri.toString());
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    logger.e("API Request: onError message", err.message);
    logger.e("API Request: onError data", err.response?.data.toString() ?? "");
    super.onError(err, handler);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    logger.i("API Request: response", response.data.toString());
    super.onResponse(response, handler);
  }
}
