import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';
import '../app_radius.dart';
import '../app_text_styles.dart';
import '../extentions/cyber_colors_ext.dart';
import '../extentions/cyber_text_styles_ext.dart';

class LightTheme {
  LightTheme._();

  static ThemeData get theme => _theme;

  static final ThemeData _theme = ThemeData(
    useMaterial3: true,
    extensions: [
      _cyberColors,
      _cyberTextStyles,
    ],
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    colorScheme: _colorScheme,
    textTheme: _textTheme,
    appBarTheme: _appBarTheme,
    cardTheme: _cardTheme,
    inputDecorationTheme: _inputDecorationTheme,
    snackBarTheme: _snackBarTheme,
  );

  static const CyberColors _cyberColors = CyberColors(
    neonCyan: AppColors.primaryVariant,
    neonPurple: AppColors.neonPurple,
    neonGreen: AppColors.neonGreen,
    neonPink: AppColors.neonPink,
    glassWhite: Color(0x33000000),
    glassWhiteStrong: Color(0x66000000),
    glassBorder: Color(0x22000000),
    glassBlack: Color(0x0A000000),
    tableRowHighlight: Color(0x33007AB8),
    tableColHighlight: Color(0x33BD00FF),
    tableCellHighlight: Color(0xFF39FF14),
  );

  static final CyberTextStyles _cyberTextStyles = CyberTextStyles(
    cipherLarge:
        AppTextStyles.cipherLarge.copyWith(color: AppColors.primaryVariant),
    cipherMedium:
        AppTextStyles.cipherMedium.copyWith(color: AppColors.primaryVariant),
    cipherSmall:
        AppTextStyles.cipherSmall.copyWith(color: AppColors.primaryVariant),
    arabicBody:
        AppTextStyles.arabicBody.copyWith(color: AppColors.lightTextPrimary),
    arabicCipher:
        AppTextStyles.arabicCipher.copyWith(color: AppColors.primaryVariant),
  );

  static const ColorScheme _colorScheme = ColorScheme.light(
    brightness: Brightness.light,
    primary: AppColors.primaryVariant,
    onPrimary: Colors.white,
    secondary: AppColors.neonPurple,
    onSecondary: Colors.white,
    tertiary: AppColors.accent,
    surface: AppColors.lightSurface,
    onSurface: AppColors.lightTextPrimary,
    error: AppColors.error,
    onError: Colors.white,
  );

  static final TextTheme _textTheme =
      GoogleFonts.interTextTheme(ThemeData.light().textTheme).copyWith(
    displayLarge:
        AppTextStyles.displayLarge.copyWith(color: AppColors.lightTextPrimary),
    displayMedium:
        AppTextStyles.displayMedium.copyWith(color: AppColors.lightTextPrimary),
    displaySmall:
        AppTextStyles.displaySmall.copyWith(color: AppColors.lightTextPrimary),
    bodyLarge:
        AppTextStyles.bodyLarge.copyWith(color: AppColors.lightTextPrimary),
    bodyMedium:
        AppTextStyles.bodyMedium.copyWith(color: AppColors.lightTextSecondary),
    bodySmall:
        AppTextStyles.bodySmall.copyWith(color: AppColors.lightTextSecondary),
    labelLarge:
        AppTextStyles.labelLarge.copyWith(color: AppColors.lightTextPrimary),
    labelMedium:
        AppTextStyles.labelMedium.copyWith(color: AppColors.lightTextSecondary),
  );

  static final AppBarTheme _appBarTheme = AppBarTheme(
    backgroundColor: AppColors.lightSurface,
    elevation: 0,
    centerTitle: true,
    titleTextStyle:
        AppTextStyles.displaySmall.copyWith(color: AppColors.lightTextPrimary),
    iconTheme: const IconThemeData(color: AppColors.primaryVariant),
  );

  static final CardThemeData _cardTheme = CardThemeData(
    color: AppColors.lightSurface,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.lg),
    ),
  );

  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
    filled: true,
    fillColor: AppColors.lightSurfaceVariant,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: const BorderSide(color: AppColors.lightSurfaceVariant),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: const BorderSide(color: AppColors.lightSurfaceVariant),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: const BorderSide(color: AppColors.primaryVariant, width: 2),
    ),
  );

  static final SnackBarThemeData _snackBarTheme = SnackBarThemeData(
    backgroundColor: AppColors.lightSurface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
    ),
    behavior: SnackBarBehavior.floating,
  );
}
