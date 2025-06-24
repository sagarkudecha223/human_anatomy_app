import 'package:flutter/material.dart';

class AppColors {
  static bool isLightTheme = false;

  // Primary brand color
  static const Color primary = Color(0xFFBB86FC);
  static const Color secondary = Color(0xFF03DAC6);

  // Light theme
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightOnPrimary = Color(0xFFFFFFFF);
  static const Color lightOnSurface = Color(0xFF000000);
  static const Color lightTextHigh = Color(0xDE000000); // 87%
  static const Color lightTextMedium = Color(0x99000000); // 60%
  static const Color lightTextDisabled = Color(0x61000000); // 38%

  // Dark theme
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkOnPrimary = Color(0xFF000000);
  static const Color darkOnSurface = Color(0xFFFFFFFF);
  static const Color darkTextHigh = Color(0xDEFFFFFF); // 87%
  static const Color darkTextMedium = Color(0x99FFFFFF); // 60%
  static const Color darkTextDisabled = Color(0x61FFFFFF); // 38%

  // Error
  static const Color error = Color(0xFFCF6679);

  static const Color lightCyan = Color(0xFFCBE2F5);
  static const Color lightRed = Color(0xFFF85C5C);
  static const Color lightGreen = Color(0xFFBEDBBF);
  static const Color lightPurple = Color(0xFFD5C6F8);
  static const Color redBackground = Color(0xFFF8D7DA);
  static const Color redText = Color(0xFFC82333);
  static const Color greenBackground = Color(0xFFD4EDDA);
  static const Color blueBackground = Color(0xFFD1ECF1);

  static Color get iconColor =>
      isLightTheme ? AppColors.darkSurface : AppColors.lightSurface;

  static Color get textColor =>
      isLightTheme ? AppColors.lightTextHigh : AppColors.darkTextHigh;

  static Color get boldTextColor =>
      isLightTheme ? AppColors.lightTextDisabled : AppColors.darkTextDisabled;

  static Color get borderColor =>
      isLightTheme ? lightTextMedium : darkTextMedium;

  static Color get shadowColor =>
      isLightTheme ? lightTextMedium : darkTextMedium;
}

class ToothColors {
  // Natural Tooth Color Shades
  static const Color lightToothShade = Color(0xFFF8F4E1);
  static const Color mediumToothShade = Color(0xFFF2E1B3);
  static const Color darkerToothShade = Color(0xFFE1C07D);
  static const Color grayishToothShade = Color(0xFFD1C4B2);
  static const Color healthyToothShade = Color(0xFFE5C39D);

  // Whitening Treatment Shades
  static const Color brightWhiteShade = Color(0xFFFFFFFF);
  static const Color offWhiteShade = Color(0xFFF6F6F6);

  // Fillings (Composite Resin) Shades
  static const Color lightFillingShade = Color(0xFFF7E1C7);
  static const Color mediumFillingShade = Color(0xFFD1A156);
  static const Color darkFillingShade = Color(0xFF9C7A38);

  // Crowns (Porcelain / Ceramic Shades)
  static const Color porcelainWhiteShade = Color(0xFFF2F3F4);
  static const Color porcelainNaturalShade = Color(0xFFE2D1A2);
}
