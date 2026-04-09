import 'package:equatable/equatable.dart';

import '../../../domain/entities/vigenere_result.dart';

class VigenereState extends Equatable {
  const VigenereState({
    this.input = '',
    this.key = '',
    this.result,
    this.tabulaRecta = const [],
    this.highlightedRow = -1,
    this.highlightedCol = -1,
    this.currentStepIndex = -1,
    this.isAnimating = false,
    this.animatedOutput = '',
    this.showTable = false,
    this.errorMessage,
  });

  final String input;
  final String key;
  final VigenereResult? result;
  final List<List<String>> tabulaRecta;
  final int highlightedRow;
  final int highlightedCol;
  final int currentStepIndex;
  final bool isAnimating;
  final String animatedOutput;
  final bool showTable;
  final String? errorMessage;

  VigenereState copyWith({
    String? input,
    String? key,
    VigenereResult? result,
    List<List<String>>? tabulaRecta,
    int? highlightedRow,
    int? highlightedCol,
    int? currentStepIndex,
    bool? isAnimating,
    String? animatedOutput,
    bool? showTable,
    String? errorMessage,
    bool clearResult = false,
    bool clearError = false,
  }) {
    return VigenereState(
      input: input ?? this.input,
      key: key ?? this.key,
      result: clearResult ? null : result ?? this.result,
      tabulaRecta: tabulaRecta ?? this.tabulaRecta,
      highlightedRow: highlightedRow ?? this.highlightedRow,
      highlightedCol: highlightedCol ?? this.highlightedCol,
      currentStepIndex: currentStepIndex ?? this.currentStepIndex,
      isAnimating: isAnimating ?? this.isAnimating,
      animatedOutput: animatedOutput ?? this.animatedOutput,
      showTable: showTable ?? this.showTable,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        input,
        key,
        result,
        tabulaRecta,
        highlightedRow,
        highlightedCol,
        currentStepIndex,
        isAnimating,
        animatedOutput,
        showTable,
        errorMessage,
      ];
}
