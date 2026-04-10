import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/di/service_locator.dart';
import 'core/routing/app_router.dart';
import 'core/shared/cubits/locale/locale_cubit.dart';
import 'core/shared/cubits/locale/locale_state.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/cubit/theme_cubit.dart';
import 'core/theme/cubit/theme_state.dart';
import 'i18n/strings.g.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupServiceLocator();

  LocaleSettings.useDeviceLocale();

  runApp(
    TranslationProvider(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => sl<ThemeCubit>()),
          BlocProvider(create: (_) => sl<LocaleCubit>()),
        ],
        child: const CipherXApp(),
      ),
    ),
  );
}

class CipherXApp extends StatelessWidget {
  const CipherXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        return BlocConsumer<LocaleCubit, LocaleState>(
          listenWhen: (prev, next) => prev != next,
          listener: (context, localeState) {
            LocaleSettings.setLocaleRaw(localeState.language.localeCode);
          },
          builder: (context, localeState) {
            return MaterialApp.router(
              title: 'CipherX',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              themeMode: themeState.isDark ? ThemeMode.dark : ThemeMode.light,
              routerConfig: appRouter,
              locale: TranslationProvider.of(context).flutterLocale,
              supportedLocales: AppLocaleUtils.supportedLocales,
              localizationsDelegates: GlobalMaterialLocalizations.delegates,
              builder: (context, child) {
                return Directionality(
                  textDirection: localeState.language.isRtl
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: child!,
                );
              },
            );
          },
        );
      },
    );
  }
}
