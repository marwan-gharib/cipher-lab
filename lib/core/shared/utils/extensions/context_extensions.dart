import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../i18n/strings.g.dart';
import '../../../theme/extentions/cyber_colors_ext.dart';
import '../../../theme/extentions/cyber_text_styles_ext.dart';
import '../../cubits/locale/locale_cubit.dart';
import '../../domain/enums/app_language.dart';

extension ContextExtensions on BuildContext {
  Translations get t => TranslationProvider.of(this).translations;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;

  CyberColors get cyberColors => CyberColors.of(this);
  CyberTextStyles get cyberText => CyberTextStyles.of(this);

  AppLanguage get locale => read<LocaleCubit>().state.language;

  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Theme.of(this).colorScheme.error : null,
      ),
    );
  }
}
