import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/app_constants.dart';
import '../../../error/exceptions/app_exception.dart';
import '../../../error/mappers/error_mapper.dart';
import '../../../local/cache/cache_service.dart';
import '../../domain/enums/app_language.dart';
import 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit(this._cacheService)
      : super(
          LocaleState(
            language: _loadLanguage(_cacheService),
          ),
        );

  final CacheService _cacheService;

  static AppLanguage _loadLanguage(CacheService cache) {
    try {
      final cached = cache.get(AppConstants.languageKey) as String?;
      if (cached != null) {
        return AppLanguage.values.firstWhere(
          (l) => l.localeCode == cached,
          orElse: () => AppLanguage.fromDeviceLocale(),
        );
      }
    } catch (_) {}
    return AppLanguage.fromDeviceLocale();
  }

  Future<void> toggleLanguage() async {
    final next = state.language == AppLanguage.english
        ? AppLanguage.arabic
        : AppLanguage.english;
    try {
      await _cacheService.setData(
        key: AppConstants.languageKey,
        value: next.localeCode,
      );
      emit(state.copyWith(language: next, clearError: true));
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
