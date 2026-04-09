import 'package:flutter/material.dart';

import '../../../../core/shared/utils/extensions/context_extensions.dart';

class TabulaRectaCell extends StatelessWidget {
  const TabulaRectaCell({
    super.key,
    required this.letter,
    this.isRowHeader = false,
    this.isColHeader = false,
    this.isHighlighted = false,
    this.isRowHighlighted = false,
    this.isColHighlighted = false,
  });

  final String letter;
  final bool isRowHeader;
  final bool isColHeader;
  final bool isHighlighted;
  final bool isRowHighlighted;
  final bool isColHighlighted;

  @override
  Widget build(BuildContext context) {
    Color? bgColor;
    if (isRowHeader) {
      bgColor = context.cyberColors.neonPurple.withValues(alpha: 0.2);
    }
    if (isColHeader) {
      bgColor = context.cyberColors.neonCyan.withValues(alpha: 0.2);
    }
    if (isRowHighlighted) {
      bgColor = context.cyberColors.tableRowHighlight;
    }
    if (isColHighlighted) {
      bgColor = context.cyberColors.tableColHighlight;
    }
    if (isHighlighted) {
      bgColor = context.cyberColors.tableCellHighlight;
    }

    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(
          color: context.cyberColors.glassBorder.withValues(alpha: 0.1),
          width: 0.5,
        ),
      ),
      child: Text(
        letter.toUpperCase(),
        style: context.cyberText.cipherSmall.copyWith(
          fontSize: 10,
          color: (isRowHeader || isColHeader || isHighlighted)
              ? Colors.white
              : context.colorScheme.onSurface.withValues(alpha: 0.7),
          fontWeight: (isRowHeader || isColHeader || isHighlighted)
              ? FontWeight.bold
              : FontWeight.normal,
        ),
      ),
    );
  }
}
