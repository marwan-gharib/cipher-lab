import 'package:equatable/equatable.dart';

import '../../domain/enums/app_language.dart';

class LocaleState extends Equatable {
  const LocaleState({
    required this.language,
    this.errorMessage,
  });

  final AppLanguage language;
  final String? errorMessage;

  LocaleState copyWith({
    AppLanguage? language,
    String? errorMessage,
    bool clearError = false,
  }) {
    return LocaleState(
      language: language ?? this.language,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [language, errorMessage];
}
