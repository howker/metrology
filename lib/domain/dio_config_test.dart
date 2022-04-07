import 'package:dio/dio.dart';

final dio = Dio(baseOptions);

BaseOptions baseOptions = BaseOptions(
  baseUrl: 'https://jsonplaceholder.typicode.com',
  connectTimeout: 5000,
  receiveTimeout: 5000,
  sendTimeout: 5000,
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

Future<dynamic> getTestData() async {
  initInterceptors();
  final response = await dio.get<dynamic>(
    '/users',
    // ignore: avoid_print
    onReceiveProgress: (count, total) => print('Count...: $count'),
  );
  if (response.statusCode == 200) {
    return response.data;
  }
  throw Exception('HTTP request error: ${response.statusCode}');
}
