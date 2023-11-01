import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_styles.dart';

class AppTheme {
  static final defaultTheme = ThemeData(
    fontFamily: "Noto Sans",
    useMaterial3: true,
    scaffoldBackgroundColor: Palette.background,
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.transparent,
      color: Palette.background,
      titleTextStyle: AppTextStyle.heading5,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: TextTheme(
        displayLarge: AppTextStyle.heading1,
        displayMedium: AppTextStyle.heading2,
        displaySmall: AppTextStyle.heading3,
        headlineMedium: AppTextStyle.heading4,
        headlineSmall: AppTextStyle.heading5,
        titleLarge: AppTextStyle.heading6,
        titleMedium: AppTextStyle.bodyLarge,
        bodyLarge: AppTextStyle.bodyMedium,
        bodyMedium: AppTextStyle.bodySmall,
        labelLarge: AppTextStyle.button,
        bodySmall: AppTextStyle.caption,
        labelSmall: AppTextStyle.overline),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Palette.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      isDense: true,
      labelStyle: AppTextStyle.caption.copyWith(color: Palette.text01),
      hintStyle: AppTextStyle.bodyMedium
          .copyWith(fontWeight: FontWeight.w400, color: Palette.text02),
      border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Palette.greyColor,
          ),
          borderRadius: BorderRadius.circular(8)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Palette.primaryColor,
          ),
          borderRadius: BorderRadius.circular(8)),
    ),
  );
}
