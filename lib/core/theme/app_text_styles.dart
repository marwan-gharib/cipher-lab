import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  // ── Display / Headings (Orbitron) ───────────────────────────
  static TextStyle displayLarge = GoogleFonts.orbitron(
    fontSize: 32,
    fontWeight: FontWeight.w900,
    letterSpacing: 2,
  );

  static TextStyle displayMedium = GoogleFonts.orbitron(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.5,
  );

  static TextStyle displaySmall = GoogleFonts.orbitron(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 1,
  );

  // ── Cipher / Mono text (JetBrains Mono) ─────────────────────
  static TextStyle cipherLarge = GoogleFonts.jetBrainsMono(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    letterSpacing: 3,
  );

  static TextStyle cipherMedium = GoogleFonts.jetBrainsMono(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 2,
  );

  static TextStyle cipherSmall = GoogleFonts.jetBrainsMono(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  );

  // ── Body text (Inter) ───────────────────────────────────────
  static TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static TextStyle labelLarge = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  static TextStyle labelMedium = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );

  // ── Arabic text override (Cairo) ────────────────────────────
  static TextStyle arabicBody = GoogleFonts.cairo(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle arabicCipher = GoogleFonts.cairo(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    letterSpacing: 2,
  );
}
