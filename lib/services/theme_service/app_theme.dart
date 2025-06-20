import 'package:flutter/material.dart';
import '../../core/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.lightSurface,
      onPrimary: AppColors.lightOnPrimary,
      onSurface: AppColors.lightOnSurface,
      error: AppColors.error,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: AppColors.lightBackground,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.lightTextHigh),
      bodyMedium: TextStyle(color: AppColors.lightTextMedium),
      bodySmall: TextStyle(color: AppColors.lightTextDisabled),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.darkSurface,
      onPrimary: AppColors.darkOnPrimary,
      onSurface: AppColors.darkOnSurface,
      error: AppColors.error,
      onError: Colors.black,
    ),
    scaffoldBackgroundColor: AppColors.darkBackground,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.darkTextHigh),
      bodyMedium: TextStyle(color: AppColors.darkTextMedium),
      bodySmall: TextStyle(color: AppColors.darkTextDisabled),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkSurface,
      foregroundColor: AppColors.darkTextHigh,
      elevation: 0,
    ),
  );
}
