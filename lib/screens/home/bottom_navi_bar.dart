import 'package:flutter/material.dart';
import 'package:infopoverka/screens/home/home_screen.dart';
import 'package:infopoverka/screens/search/search_screen.dart';

class BottomNaviBar extends StatefulWidget {
  const BottomNaviBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNaviBar> createState() => _BottomNaviBarState();
}

class _BottomNaviBarState extends State<BottomNaviBar> {
  @override
  Widget build(BuildContext context) {
    var index = 0;
    final screens = [
      const HomeScreen(),
      //FavoriteScreen(),
      //SettingsScreen(),
    ];
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: Colors.blue.shade100,
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        )),
      ),
      child: NavigationBar(
        selectedIndex: index,
        height: 60,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (currentIndex) {
          index = currentIndex;
          setState(() {});
        },
        animationDuration: const Duration(seconds: 3),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Домой',
            selectedIcon: Icon(Icons.home),
          ),
          NavigationDestination(
            icon: Icon(Icons.star_outline),
            label: 'Избранное',
            selectedIcon: Icon(Icons.star),
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            label: 'Настройки',
            selectedIcon: Icon(Icons.settings_rounded),
          ),
        ],
      ),
    );
  }
}
