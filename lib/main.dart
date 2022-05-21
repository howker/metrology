import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:infopoverka/data/favorites_repository.dart';
import 'package:infopoverka/data/items_repository.dart';
import 'package:infopoverka/locator_service.dart' as di;
import 'package:infopoverka/models/items_hive_adapter.dart';
import 'package:infopoverka/providers/buttons_provider.dart';
import 'package:infopoverka/providers/data_range_provider.dart';
import 'package:infopoverka/providers/favorites_provider.dart';
import 'package:infopoverka/providers/filter_provider.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:infopoverka/providers/screen_provider.dart';
import 'package:infopoverka/providers/select_provider.dart';
import 'package:infopoverka/providers/theme_provider.dart';
import 'package:infopoverka/providers/visibility_provider.dart';
import 'package:infopoverka/root_screen.dart';
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

Future<void> main() async {
  ///this block is solution for error:
  ///CERTIFICATE_VERIFY_FAILED: unable to get local issuer certificate Error
  HttpOverrides.global = MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Hive.initFlutter();
  Hive.registerAdapter(ItemsHiveAdapter());
  await Hive.openBox<bool>('accurateBox');
  await Hive.openBox<bool>('darkModeBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ItemListProvider>(
          create: (_) => ItemListProvider(
            itemsRepo: di.sl.get<ItemsRepository>(),
            favoritesRepo: di.sl.get<FavoritesRepository>(),
          ),
        ),
        ChangeNotifierProvider<DataRangeProvider>(
          create: (_) => DataRangeProvider(),
        ),
        ChangeNotifierProvider<FilterProvider>(
          create: (_) => FilterProvider(),
        ),
        ChangeNotifierProvider<SelectProvider>(
          create: (_) => SelectProvider(),
        ),
        ChangeNotifierProvider<ScreenProvider>(
          create: (_) => ScreenProvider(),
        ),
        ChangeNotifierProvider<FavoritesProvider>(
          create: (_) => FavoritesProvider(
            favoritesRepo: di.sl.get<FavoritesRepository>(),
          ),
        ),
        ChangeNotifierProvider<ButtonsProvider>(
          create: (_) => ButtonsProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider<VisibilityProvider>(
          create: (_) => VisibilityProvider(),
        ),
      ],
      child: const RootScreen(),
    );
  }
}
