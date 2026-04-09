import 'package:equatable/equatable.dart';

import '../../domain/enums/app_language.dart';

class LocaleState extends Equatable {
  const LocaleState({required this.language});

  final AppLanguage language;

  @override
  List<Object?> get props => [language];
}
