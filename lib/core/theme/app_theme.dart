import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class AppTheme {
  static ThemeData light() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primaryGreen,
      brightness: Brightness.light,
      surface: AppColors.background,
      primary: AppColors.primaryGreen,
      secondary: AppColors.accentYellow,
    );

    return ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.background,
      useMaterial3: true,
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: AppSizes.h1,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryText,
        ),
        headlineMedium: TextStyle(
          fontSize: AppSizes.h2,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryText,
        ),
        bodyLarge: TextStyle(
          fontSize: AppSizes.body,
          color: AppColors.primaryText,
        ),
        bodyMedium: TextStyle(
          fontSize: AppSizes.body,
          color: AppColors.secondaryText,
        ),
        bodySmall: TextStyle(
          fontSize: AppSizes.caption,
          color: AppColors.secondaryText,
        ),
      ),
    );
  }
}
