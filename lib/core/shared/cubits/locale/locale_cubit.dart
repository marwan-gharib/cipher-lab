import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/enums/app_language.dart';
import 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleState(language: AppLanguage.fromDeviceLocale()));

  void toggleLanguage() {
    final next = state.language == AppLanguage.english
        ? AppLanguage.arabic
        : AppLanguage.english;
    emit(LocaleState(language: next));
  }

  void setLanguage(AppLanguage language) => emit(LocaleState(language: language));
}
