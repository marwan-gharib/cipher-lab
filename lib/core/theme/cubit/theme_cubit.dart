import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_constants.dart';
import '../../error/exceptions/app_exception.dart';
import '../../error/mappers/error_mapper.dart';
import '../../local/cache/cache_service.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(this._cacheService)
      : super(
          ThemeState(
            isDark: (_cacheService.get(AppConstants.themeKey) as bool?) ?? true,
          ),
        );

  final CacheService _cacheService;

  Future<void> toggleTheme() async {
    final isDark = !state.isDark;
    try {
      await _cacheService.setData(key: AppConstants.themeKey, value: isDark);
      emit(state.copyWith(isDark: isDark, clearError: true));
    } on AppException catch (e) {
      emit(
        state.copyWith(
          errorMessage: ErrorMapper.mapExceptionToFailure(e).message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
