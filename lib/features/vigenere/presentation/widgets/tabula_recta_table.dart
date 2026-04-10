import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/domain/enums/app_language.dart';
import '../../../../core/theme/app_spacing.dart';
import '../cubits/vigenere/vigenere_cubit.dart';
import '../cubits/vigenere/vigenere_state.dart';
import 'tabula_recta_cell.dart';

class TabulaRectaTable extends StatelessWidget {
  const TabulaRectaTable({
    super.key,
    required this.language,
  });

  final AppLanguage language;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VigenereCubit, VigenereState>(
      buildWhen: (prev, next) => prev.showTable != next.showTable,
      builder: (context, state) {
        if (!state.showTable || state.tabulaRecta.isEmpty) {
          return const SizedBox.shrink();
        }

        final table = state.tabulaRecta;
        final alphabet = language.alphabet;

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: Column(
                children: [
                  Row(
                    children: [
                      const TabulaRectaCell(
                        letter: '',
                        isColHeader: true,
                        rowIdx: -1,
                        colIdx: -1,
                      ),
                      ...List.generate(
                        alphabet.length,
                        (i) => TabulaRectaCell(
                          letter: alphabet[i],
                          isColHeader: true,
                          rowIdx: -1,
                          colIdx: i,
                        ),
                      ),
                    ],
                  ),
                  ...List.generate(
                    table.length,
                    (rowIdx) => Row(
                      children: [
                        TabulaRectaCell(
                          letter: alphabet[rowIdx],
                          isRowHeader: true,
                          rowIdx: rowIdx,
                          colIdx: -1,
                        ),
                        ...List.generate(
                          table[rowIdx].length,
                          (colIdx) => TabulaRectaCell(
                            letter: table[rowIdx][colIdx],
                            rowIdx: rowIdx,
                            colIdx: colIdx,
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
      },
    );
  }
}
