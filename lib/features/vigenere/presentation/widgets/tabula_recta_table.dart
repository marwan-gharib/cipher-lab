import 'package:flutter/material.dart';

import '../../../../core/shared/domain/enums/app_language.dart';
import '../../../../core/theme/app_spacing.dart';
import 'tabula_recta_cell.dart';

class TabulaRectaTable extends StatelessWidget {
  const TabulaRectaTable({
    super.key,
    required this.table,
    required this.language,
    this.highlightedRow = -1,
    this.highlightedCol = -1,
  });

  final List<List<String>> table;
  final AppLanguage language;
  final int highlightedRow;
  final int highlightedCol;

  @override
  Widget build(BuildContext context) {
    if (table.isEmpty) return const SizedBox.shrink();

    final alphabet = language.alphabet;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.sm),
          child: Column(
            children: [
              // Column headers
              Row(
                children: [
                  const TabulaRectaCell(letter: '', isColHeader: true),
                  ...List.generate(
                    alphabet.length,
                    (i) => TabulaRectaCell(
                      letter: alphabet[i],
                      isColHeader: true,
                      isColHighlighted: i == highlightedCol,
                    ),
                  ),
                ],
              ),
              // Filter & rows
              ...List.generate(
                table.length,
                (rowIdx) => Row(
                  children: [
                    TabulaRectaCell(
                      letter: alphabet[rowIdx],
                      isRowHeader: true,
                      isRowHighlighted: rowIdx == highlightedRow,
                    ),
                    ...List.generate(
                      table[rowIdx].length,
                      (colIdx) => TabulaRectaCell(
                        letter: table[rowIdx][colIdx],
                        isHighlighted: rowIdx == highlightedRow &&
                            colIdx == highlightedCol,
                        isRowHighlighted: rowIdx == highlightedRow,
                        isColHighlighted: colIdx == highlightedCol,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
