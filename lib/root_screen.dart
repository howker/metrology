import 'package:flutter/material.dart';
import 'package:infopoverka/providers/screen_provider.dart';
import 'package:infopoverka/providers/theme_provider.dart';
import 'package:infopoverka/screens/favorites/favorites_screen.dart';
import 'package:infopoverka/screens/home/bottom_navi_bar.dart';
import 'package:infopoverka/screens/home/home_screen.dart';
import 'package:infopoverka/screens/settings/settings_screen.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final index = context.watch<ScreenProvider>().currentScreenIndex;

    return MaterialApp(
      themeMode: context.watch<ThemeProvider>().getIsDark
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: ThemeData.light().copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        bottomNavigationBar: const BottomNaviBar(),
        body: screens[index],
      ),
    );
  }
}

const screens = <Widget>[
  HomeScreen(),
  FavoritesScreen(),
  SettingsScreen(),
];
