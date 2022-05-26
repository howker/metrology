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
        title: Text(
          'Настройки',
          style: Theme.of(context)
              .textTheme
              .headline1
              ?.copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Тёмная тема',
                  style: Theme.of(context).textTheme.headline2,
                ),
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
