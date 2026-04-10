import 'package:equatable/equatable.dart';

class ThemeState extends Equatable {
  const ThemeState({
    required this.isDark,
    this.errorMessage,
  });

  final bool isDark;
  final String? errorMessage;

  ThemeState copyWith({
    bool? isDark,
    String? errorMessage,
    bool clearError = false,
  }) {
    return ThemeState(
      isDark: isDark ?? this.isDark,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [isDark, errorMessage];
}
