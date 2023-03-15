import 'package:dio/dio.dart';

import '../app_config.dart';
import 'log_interceptor.dart';

class DioClient {
  late Dio _dio;

  DioClient() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConfig.instance?.baseUrl ?? '',
    );
    _dio = Dio(options);
    _dio.interceptors.add(LogInterceptors());
  }

  Future<Response<T>> requestGet<T>(
    final String path, {
    final Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get(
      path,
      queryParameters: queryParameters ?? <String, dynamic>{},
    );
  }
}
