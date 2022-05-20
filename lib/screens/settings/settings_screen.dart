import 'package:flutter/material.dart';
import 'package:infopoverka/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeProvider>().isDark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Тёмная тема'),
                Switch.adaptive(
                  value: isDark,
                  onChanged: (newValue) {
                    context.read<ThemeProvider>().changeTheme();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
