import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:infopoverka/utils/ui_messages.dart';

class ApiClient {
  CancelToken token = CancelToken();
  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://fgis.gost.ru/fundmetrology/eapi/',
      connectTimeout: 50000,
      receiveTimeout: 5000000,
      sendTimeout: 5000000,
    ),
  );

  void initInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          log(
            'Request is sending: ${options.method} ${options.baseUrl}${options.path}',
          );
          return handler.next(options);
        },
        onResponse: (responce, handler) {
          log('Answer was received: ${responce.data}');
          return handler.next(responce);
        },
        onError: (error, handler) {
          if (error.type == DioErrorType.connectTimeout) {
            UIMessages.showSimpleToast('connectTimeout');
            token.cancel();
          }
          if (error.type == DioErrorType.response) {
            UIMessages.showSimpleToast(error.message);
            token.cancel();
          }
          if (error.type == DioErrorType.cancel) {
            UIMessages.showSimpleToast(error.message);
          }
          log('It was error: $error');
        },
      ),
    );
  }
}
