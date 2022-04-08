import 'package:dio/dio.dart';

BaseOptions baseOptions = BaseOptions(
  baseUrl: 'https://fgis.gost.ru/fundmetrology/eapi/vri?',
  connectTimeout: 5000,
  receiveTimeout: 50000,
  sendTimeout: 5000,
);
