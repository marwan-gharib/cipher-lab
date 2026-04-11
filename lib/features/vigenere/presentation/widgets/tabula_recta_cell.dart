import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/utils/extensions/context_extensions.dart';
import '../cubits/vigenere/vigenere_cubit.dart';

class TabulaRectaCell extends StatelessWidget {
  const TabulaRectaCell({
    super.key,
    required this.letter,
    required this.rowIdx,
    required this.colIdx,
    this.isRowHeader = false,
    this.isColHeader = false,
  });

  final String letter;
  final int rowIdx;
  final int colIdx;
  final bool isRowHeader;
  final bool isColHeader;

  @override
  Widget build(BuildContext context) {
    final isRowHighlighted = context.select<VigenereCubit, bool>(
      (cubit) =>
          cubit.state.isAnimating && cubit.state.highlightedRow == rowIdx,
    );
    final isColHighlighted = context.select<VigenereCubit, bool>(
      (cubit) =>
          cubit.state.isAnimating && cubit.state.highlightedCol == colIdx,
    );
    final isHighlighted = context.select<VigenereCubit, bool>(
      (cubit) =>
          cubit.state.isAnimating &&
          cubit.state.highlightedRow == rowIdx &&
          cubit.state.highlightedCol == colIdx,
    );

    Color? bgColor;
    if (isRowHeader) {
      bgColor = context.cyberColors.neonPurple.withValues(alpha: 0.2);
    } else if (isColHeader) {
      bgColor = context.cyberColors.neonCyan.withValues(alpha: 0.2);
    } else {
      if (isHighlighted) {
        bgColor = context.cyberColors.tableCellHighlight;
      } else if (isRowHighlighted) {
        bgColor = context.cyberColors.tableRowHighlight;
      } else if (isColHighlighted) {
        bgColor = context.cyberColors.tableColHighlight;
      }
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
          fontSize: 12,
          color: isHighlighted
              ? Colors.white
              : (isRowHeader || isColHeader)
                  ? (context.isDarkMode
                      ? Colors.white
                      : context.colorScheme.onSurface)
                  : context.colorScheme.onSurface.withValues(alpha: 0.7),
          fontWeight: (isRowHeader || isColHeader || isHighlighted)
              ? FontWeight.bold
              : FontWeight.normal,
        ),
      ),
    );
  }
}
