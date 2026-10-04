import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_color.dart';

abstract final class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColor.bgColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary,
      brightness: Brightness.light,
      primary: AppColor.primary,
      secondary: AppColor.second,
      surface: AppColor.bgColor,
      onSurfaceVariant: AppColor.white,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: .fixed,
      backgroundColor: AppColor.second,
      selectedItemColor: AppColor.primary,
      showSelectedLabels: false,

      unselectedItemColor: AppColor.white,
      showUnselectedLabels: false,
    ),
    textTheme: TextTheme(
      displayMedium: TextStyle(
        color: AppColor.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
        color: AppColor.primary,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
