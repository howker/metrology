import 'package:dio/dio.dart';

class ApiClient {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://fgis.gost.ru/fundmetrology/eapi/vri?rows=100&',
      connectTimeout: 5000,
      receiveTimeout: 50000,
      sendTimeout: 5000,
    ),
  );

  void initInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // ignore: avoid_print
          print(
            'Request is sending: ${options.method} ${options.baseUrl}${options.path}',
          );
          return handler.next(options);
        },
        onResponse: (responce, handler) {
          //print('Answer was received: ${responce.data}');
          return handler.next(responce);
        },
        onError: (error, handler) {
          // ignore: avoid_print
          print('It was error: $error');
        },
      ),
    );
  }
}
