import 'package:flutter/material.dart';
import 'package:infopoverka/providers/data_range_provider.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:infopoverka/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
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
