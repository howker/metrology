import 'package:flutter/material.dart';
import 'package:infopoverka/providers/screen_provider.dart';
import 'package:infopoverka/screens/favorites/favorites_screen.dart';
import 'package:infopoverka/screens/home/home_screen.dart';
import 'package:infopoverka/screens/settings/settings_screen.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final index = context.watch<ScreenProvider>().currentScreenIndex;
    final screens = <Widget>[
      const HomeScreen(),
      const FavoritesScreen(),
      const SettingsScreen(),
    ];
    return MaterialApp(
      home: screens[index],
    );
  }
}
