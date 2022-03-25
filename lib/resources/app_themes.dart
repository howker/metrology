import 'package:flutter/material.dart';
import 'package:wundertusk/resources/app_colors.dart';
import 'package:wundertusk/resources/app_text_styles.dart';

class AppThemes {
  static ThemeData mainTheme = ThemeData(
    fontFamily: 'SF UI Display',
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: AppColors.kColBackground,
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      backgroundColor: AppColors.kColBackground,
      iconTheme: IconThemeData(
        color: AppColors.kColBase,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      isCollapsed: true,
      labelStyle: AppTextStyles.kSFFootnote,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.kColBase3),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.kColBase3),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.kColPurple),
      ),
    ),
  );

  const AppThemes._();
}
