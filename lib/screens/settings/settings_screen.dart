import 'package:flutter/material.dart';
import 'package:infopoverka/providers/theme_provider.dart';
import 'package:infopoverka/screens/home/bottom_navi_bar.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeProvider>().isDark;
    return Scaffold(
      bottomNavigationBar: const BottomNaviBar(),
      appBar: AppBar(
        title: const Text('Настройки'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Switch.adaptive(
                value: isDark,
                onChanged: (newValue) {
                  context.read<ThemeProvider>().changeTheme();
                },
              ),
              const Text('Тёмная тема'),
            ],
          ),
        ],
      ),
    );
  }
}
