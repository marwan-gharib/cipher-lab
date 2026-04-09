import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(isDark: true));

  void toggleTheme() => emit(ThemeState(isDark: !state.isDark));

  void setDark() => emit(const ThemeState(isDark: true));

  void setLight() => emit(const ThemeState(isDark: false));
}
