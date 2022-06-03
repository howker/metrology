import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:infopoverka/providers/connectivity_provider.dart';
import 'package:infopoverka/providers/screen_provider.dart';
import 'package:infopoverka/providers/theme_provider.dart';
import 'package:infopoverka/screens/favorites/favorites_screen.dart';
import 'package:infopoverka/screens/home/bottom_navi_bar.dart';
import 'package:infopoverka/screens/home/home_screen.dart';
import 'package:infopoverka/screens/themes.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ConnectivityProvider>().startMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    final index = context.watch<ScreenProvider>().currentScreenIndex;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeProvider>().getIsDark ? darkTheme : lightTheme,
      darkTheme: darkTheme,
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
];
