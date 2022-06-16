import 'package:dio/dio.dart';
import 'exc_service.dart';
import 'log_service.dart';

/// This service will change later
class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    LogService.o('REQUEST[${options.method}] => PATH: ${options.path}');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    LogService.i('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    LogService.i('RESPONSE[${response.statusCode}] => DATA: ${response.requestOptions.data}');
    return handler.resolve(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    try {
      int? statusCode = err.response?.statusCode!;
      LogService.e('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
      LogService.e('ERROR[${err.response?.statusCode}] => DATA: ${err.requestOptions.data}');
      throw ServerException(statusCode!);
    } on ServerException catch (e) {
      LogService.w(e.toString());
    } catch(e) {
      LogService.w(e.toString());
    }
  }
}