import 'package:equatable/equatable.dart';

import '../../../domain/entities/caesar_result.dart';

class CaesarState extends Equatable {
  const CaesarState({
    this.input = '',
    this.shift = 10,
    this.result,
    this.bruteForceResults = const [],
    this.isAnimating = false,
    this.animatedOutput = '',
    this.errorMessage,
  });

  final String input;
  final int shift;
  final CaesarResult? result;
  final List<CaesarResult> bruteForceResults;
  final bool isAnimating;
  final String animatedOutput;
  final String? errorMessage;

  CaesarState copyWith({
    String? input,
    int? shift,
    CaesarResult? result,
    List<CaesarResult>? bruteForceResults,
    bool? isAnimating,
    String? animatedOutput,
    String? errorMessage,
    bool clearResult = false,
    bool clearError = false,
    bool clearBruteForce = false,
  }) {
    return CaesarState(
      input: input ?? this.input,
      shift: shift ?? this.shift,
      result: clearResult ? null : result ?? this.result,
      bruteForceResults:
          clearBruteForce ? [] : bruteForceResults ?? this.bruteForceResults,
      isAnimating: isAnimating ?? this.isAnimating,
      animatedOutput: animatedOutput ?? this.animatedOutput,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        input,
        shift,
        result,
        bruteForceResults,
        isAnimating,
        animatedOutput,
        errorMessage,
      ];
}
