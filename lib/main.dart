import 'dart:io';
import 'package:flutter/material.dart';
import 'package:infopoverka/data/items_repository.dart';
import 'package:infopoverka/locator_service.dart' as di;
import 'package:infopoverka/providers/data_range_provider.dart';
import 'package:infopoverka/providers/filter_provider.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:infopoverka/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

// TODO(me): for animation all elements : animations: ^2.0.2

///this block is solution for error:
///CERTIFICATE_VERIFY_FAILED: unable to get local issuer certificate Error
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}

Future<void> main() async {
  ///this block is solution for error:
  ///CERTIFICATE_VERIFY_FAILED: unable to get local issuer certificate Error
  HttpOverrides.global = MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ItemListProvider>(
          create: (_) =>
              ItemListProvider(itemsRepo: di.sl.get<ItemsRepository>()),
        ),
        ChangeNotifierProvider<DataRangeProvider>(
          create: (_) => DataRangeProvider(),
        ),
        ChangeNotifierProvider<FilterProvider>(
          create: (_) => FilterProvider(),
        ),
      ],
      child: const MaterialApp(
        themeMode: ThemeMode.dark,
        home: HomeScreen(),
      ),
    );
  }
}
