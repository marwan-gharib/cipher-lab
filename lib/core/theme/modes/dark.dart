import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';
import '../app_radius.dart';
import '../app_text_styles.dart';
import '../extentions/cyber_colors_ext.dart';
import '../extentions/cyber_text_styles_ext.dart';

class DarkTheme {
  DarkTheme._();

  static ThemeData get theme => _theme;

  static final ThemeData _theme = ThemeData(
    useMaterial3: true,
    extensions: [
      _cyberColors,
      _cyberTextStyles,
    ],
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: _colorScheme,
    textTheme: _textTheme,
    appBarTheme: _appBarTheme,
    cardTheme: _cardTheme,
    inputDecorationTheme: _inputDecorationTheme,
    sliderTheme: _sliderTheme,
    snackBarTheme: _snackBarTheme,
    iconTheme: const IconThemeData(color: AppColors.neonCyan),
    dividerColor: AppColors.glassBorder,
  );

  static const CyberColors _cyberColors = CyberColors(
    neonCyan: AppColors.neonCyan,
    neonPurple: AppColors.neonPurple,
    neonGreen: AppColors.neonGreen,
    neonPink: AppColors.neonPink,
    glassWhite: AppColors.glassWhite,
    glassWhiteStrong: AppColors.glassWhiteStrong,
    glassBorder: AppColors.glassBorder,
    glassBlack: AppColors.glassBlack,
    tableRowHighlight: AppColors.tableRowHighlight,
    tableColHighlight: AppColors.tableColHighlight,
    tableCellHighlight: AppColors.tableCellHighlight,
  );

  static final CyberTextStyles _cyberTextStyles = CyberTextStyles(
    cipherLarge: AppTextStyles.cipherLarge.copyWith(color: AppColors.neonCyan),
    cipherMedium:
        AppTextStyles.cipherMedium.copyWith(color: AppColors.neonCyan),
    cipherSmall: AppTextStyles.cipherSmall.copyWith(color: AppColors.neonCyan),
    arabicBody: AppTextStyles.arabicBody.copyWith(color: AppColors.textPrimary),
    arabicCipher:
        AppTextStyles.arabicCipher.copyWith(color: AppColors.neonCyan),
  );

  static const ColorScheme _colorScheme = ColorScheme.dark(
    brightness: Brightness.dark,
    primary: AppColors.neonCyan,
    onPrimary: AppColors.textOnNeon,
    secondary: AppColors.neonPurple,
    onSecondary: AppColors.textPrimary,
    tertiary: AppColors.neonGreen,
    surface: AppColors.surface,
    onSurface: AppColors.textPrimary,
    error: AppColors.error,
    onError: AppColors.textPrimary,
  );

  static final TextTheme _textTheme =
      GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
    displayLarge:
        AppTextStyles.displayLarge.copyWith(color: AppColors.textPrimary),
    displayMedium:
        AppTextStyles.displayMedium.copyWith(color: AppColors.textPrimary),
    displaySmall:
        AppTextStyles.displaySmall.copyWith(color: AppColors.textPrimary),
    bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.textPrimary),
    bodyMedium:
        AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
    bodySmall: AppTextStyles.bodySmall.copyWith(color: AppColors.textDisabled),
    labelLarge: AppTextStyles.labelLarge.copyWith(color: AppColors.textPrimary),
    labelMedium:
        AppTextStyles.labelMedium.copyWith(color: AppColors.textSecondary),
  );

  static final AppBarTheme _appBarTheme = AppBarTheme(
    backgroundColor: AppColors.background,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: AppTextStyles.displaySmall,
    iconTheme: const IconThemeData(color: AppColors.neonCyan),
  );

  static final CardThemeData _cardTheme = CardThemeData(
    color: AppColors.surface,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.lg),
      side: const BorderSide(color: AppColors.glassBorder, width: 1),
    ),
  );

  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
    contentPadding: const EdgeInsetsDirectional.only(
      start: 12,
      end: 40,
      top: 20,
      bottom: 12,
    ),
    filled: true,
    fillColor: AppColors.glassBlack,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: const BorderSide(color: AppColors.glassBorder),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: const BorderSide(color: AppColors.glassBorder),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: const BorderSide(color: AppColors.neonCyan, width: 2),
    ),
    hintStyle: AppTextStyles.bodyMedium,
    labelStyle: AppTextStyles.labelLarge,
  );

  static const SliderThemeData _sliderTheme = SliderThemeData(
    activeTrackColor: AppColors.neonCyan,
    inactiveTrackColor: AppColors.surfaceVariant,
    thumbColor: AppColors.neonCyan,
    overlayColor: AppColors.tableRowHighlight,
    valueIndicatorColor: AppColors.neonCyan,
    valueIndicatorTextStyle: TextStyle(color: AppColors.textOnNeon),
  );

  static final SnackBarThemeData _snackBarTheme = SnackBarThemeData(
    backgroundColor: AppColors.surface,
    contentTextStyle: AppTextStyles.bodyMedium,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
    ),
    behavior: SnackBarBehavior.floating,
  );
}
