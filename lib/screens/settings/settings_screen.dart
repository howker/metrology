import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:infopoverka/screens/home/bottom_navi_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNaviBar(),
      appBar: AppBar(
        title: const Text('Настройки'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
            builder: (context, Box box, _) {
              final darkMode =
                  box.get('darkModeBox', defaultValue: false) as bool;
              return Row(
                children: [
                  Switch.adaptive(
                    value: darkMode,
                    onChanged: (newValue) {
                      Hive.box<bool>('darkModeBox')
                          .put('darkModeBox', newValue);
                    },
                  ),
                  const Text('Тёмная тема'),
                ],
              );
            },
            valueListenable: Hive.box<bool>('darkModeBox').listenable(),
          ),
        ],
      ),
    );
  }
}
