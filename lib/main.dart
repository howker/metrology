import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:infopoverka/domain/dio_base_options.dart';
import 'package:infopoverka/providers/data_range_provider.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:infopoverka/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

///this block is solution for error:
///CERTIFICATE_VERIFY_FAILED: unable to get local issuer certificate Error
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}

//TODO get_id or Provider as DI ???

final dio = Dio(baseOptions);
final token = CancelToken();

void main() {
  ///this block is solution for error:
  ///CERTIFICATE_VERIFY_FAILED: unable to get local issuer certificate Error
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ItemListProvider>(
          create: (_) => ItemListProvider(),
        ),
        ChangeNotifierProvider<DataRangeProvider>(
          create: (_) => DataRangeProvider(),
        ),
      ],
      child: const MaterialApp(
        themeMode: ThemeMode.dark,
        home: HomeScreen(),
      ),
    );
  }
}
