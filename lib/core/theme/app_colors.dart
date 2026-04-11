import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Dark Background ──────────────────────────────────────────
  static const Color background = Color(0xFF0A0E21);
  static const Color surface = Color(0xFF1A1A2E);
  static const Color surfaceVariant = Color(0xFF16213E);
  static const Color cardSurface = Color(0xFF0F3460);

  // ── Neon Accents ─────────────────────────────────────────────
  static const Color neonCyan = Color(0xFF00F5FF);
  static const Color neonPurple = Color(0xFFBD00FF);
  static const Color neonGreen = Color(0xFF39FF14);
  static const Color neonPink = Color(0xFFFF006E);

  // ── Light Theme ───────────────────────────────────────────────
  static const Color lightBackground = Color(0xFFF0F4FF);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceVariant = Color(0xFFE8EEFF);
  static const Color lightCardSurface = Color(0xFFDDE4FF);

  static const Color lightNeonCyan = Color(0xFF006B7D);
  static const Color lightNeonPurple = Color(0xFF7B1FA2);
  static const Color lightNeonGreen = Color(0xFF2E7D32);
  static const Color lightNeonPink = Color(0xFFC2185B);

  // ── Primary ──────────────────────────────────────────────────
  static const Color primary = neonCyan;
  static const Color primaryVariant = Color(0xFF007AB8);
  static const Color secondary = neonPurple;
  static const Color accent = neonGreen;

  // ── Text ─────────────────────────────────────────────────────
  static const Color textPrimary = Color(0xFFE8EAF6);
  static const Color textSecondary = Color(0xFF9FA8DA);
  static const Color textDisabled = Color(0xFF424983);
  static const Color textOnNeon = Color(0xFF0A0E21);

  static const Color lightTextPrimary = Color(0xFF1A1A2E);
  static const Color lightTextSecondary = Color(0xFF4A4A7A);
  static const Color lightTextDisabled = Color(0xFF9FA8DA);

  // ── Glassmorphism ─────────────────────────────────────────────
  static const Color glassWhite = Color(0x1AFFFFFF);
  static const Color glassWhiteStrong = Color(0x33FFFFFF);
  static const Color glassBorder = Color(0x40FFFFFF);
  static const Color glassBlack = Color(0x1A000000);

  // ── Light Glassmorphism ───────────────────────────────────────
  static const Color lightGlassWhite = Color(0x33000000);
  static const Color lightGlassWhiteStrong = Color(0x66000000);
  static const Color lightGlassBorder = Color(0x22000000);
  static const Color lightGlassBlack = Color(0x0A000000);

  // ── State Colors ──────────────────────────────────────────────
  static const Color success = neonGreen;
  static const Color error = neonPink;
  static const Color warning = Color(0xFFFFD60A);
  static const Color info = neonCyan;

  // ── Glow ──────────────────────────────────────────────────────
  static Color cyanGlow = neonCyan.withValues(alpha: 0.4);
  static Color purpleGlow = neonPurple.withValues(alpha: 0.4);
  static Color greenGlow = neonGreen.withValues(alpha: 0.4);

  // ── Table Highlight ───────────────────────────────────────────
  static const Color tableRowHighlight = Color(0x5500F5FF);
  static const Color tableColHighlight = Color(0x55BD00FF);
  static const Color tableCellHighlight = Color(0xFF39FF14);

  // ── Light Table Highlight ─────────────────────────────────────
  static const Color lightTableRowHighlight = Color(0x33006B7D);
  static const Color lightTableColHighlight = Color(0x337B1FA2);

  // ── Gradient Backgrounds ──────────────────────────────────────
  static const Color lightGradientBackground =
      Color.fromARGB(255, 188, 191, 202);
  static const Color darkGradientBackground =
      Color.fromARGB(255, 24, 67, 186);
}
