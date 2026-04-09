import 'package:flutter/material.dart';

class CyberColors extends ThemeExtension<CyberColors> {
  const CyberColors({
    required this.neonCyan,
    required this.neonPurple,
    required this.neonGreen,
    required this.neonPink,
    required this.glassWhite,
    required this.glassWhiteStrong,
    required this.glassBorder,
    required this.glassBlack,
    required this.tableRowHighlight,
    required this.tableColHighlight,
    required this.tableCellHighlight,
  });

  final Color neonCyan;
  final Color neonPurple;
  final Color neonGreen;
  final Color neonPink;
  final Color glassWhite;
  final Color glassWhiteStrong;
  final Color glassBorder;
  final Color glassBlack;
  final Color tableRowHighlight;
  final Color tableColHighlight;
  final Color tableCellHighlight;

  @override
  CyberColors copyWith({
    Color? neonCyan,
    Color? neonPurple,
    Color? neonGreen,
    Color? neonPink,
    Color? glassWhite,
    Color? glassWhiteStrong,
    Color? glassBorder,
    Color? glassBlack,
    Color? tableRowHighlight,
    Color? tableColHighlight,
    Color? tableCellHighlight,
  }) {
    return CyberColors(
      neonCyan: neonCyan ?? this.neonCyan,
      neonPurple: neonPurple ?? this.neonPurple,
      neonGreen: neonGreen ?? this.neonGreen,
      neonPink: neonPink ?? this.neonPink,
      glassWhite: glassWhite ?? this.glassWhite,
      glassWhiteStrong: glassWhiteStrong ?? this.glassWhiteStrong,
      glassBorder: glassBorder ?? this.glassBorder,
      glassBlack: glassBlack ?? this.glassBlack,
      tableRowHighlight: tableRowHighlight ?? this.tableRowHighlight,
      tableColHighlight: tableColHighlight ?? this.tableColHighlight,
      tableCellHighlight: tableCellHighlight ?? this.tableCellHighlight,
    );
  }

  @override
  CyberColors lerp(ThemeExtension<CyberColors>? other, double t) {
    if (other is! CyberColors) return this;
    return CyberColors(
      neonCyan: Color.lerp(neonCyan, other.neonCyan, t)!,
      neonPurple: Color.lerp(neonPurple, other.neonPurple, t)!,
      neonGreen: Color.lerp(neonGreen, other.neonGreen, t)!,
      neonPink: Color.lerp(neonPink, other.neonPink, t)!,
      glassWhite: Color.lerp(glassWhite, other.glassWhite, t)!,
      glassWhiteStrong:
          Color.lerp(glassWhiteStrong, other.glassWhiteStrong, t)!,
      glassBorder: BorderSide.lerp(
        BorderSide(color: glassBorder),
        BorderSide(color: other.glassBorder),
        t,
      ).color,
      glassBlack: Color.lerp(glassBlack, other.glassBlack, t)!,
      tableRowHighlight:
          Color.lerp(tableRowHighlight, other.tableRowHighlight, t)!,
      tableColHighlight:
          Color.lerp(tableColHighlight, other.tableColHighlight, t)!,
      tableCellHighlight:
          Color.lerp(tableCellHighlight, other.tableCellHighlight, t)!,
    );
  }

  static CyberColors of(BuildContext context) =>
      Theme.of(context).extension<CyberColors>()!;
}
