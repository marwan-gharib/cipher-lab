///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsAr with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsAr _root = this; // ignore: unused_field

	@override 
	TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppAr app = _TranslationsAppAr._(_root);
	@override late final _TranslationsSplashAr splash = _TranslationsSplashAr._(_root);
	@override late final _TranslationsHomeAr home = _TranslationsHomeAr._(_root);
	@override late final _TranslationsCaesarAr caesar = _TranslationsCaesarAr._(_root);
	@override late final _TranslationsVigenereAr vigenere = _TranslationsVigenereAr._(_root);
	@override late final _TranslationsCommonAr common = _TranslationsCommonAr._(_root);
	@override late final _TranslationsErrorsAr errors = _TranslationsErrorsAr._(_root);
}

// Path: app
class _TranslationsAppAr implements TranslationsAppEn {
	_TranslationsAppAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'CipherX';
}

// Path: splash
class _TranslationsSplashAr implements TranslationsSplashEn {
	_TranslationsSplashAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'مختبر الشفرات';
	@override String get tagline => 'شفر رسالتك بأمان';
}

// Path: home
class _TranslationsHomeAr implements TranslationsHomeEn {
	_TranslationsHomeAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'مختبر الشفرات';
	@override String get subtitle => 'اختر طريقة لقفل رسالتك';
	@override String get chooseCipher => 'كيف تريد قفلها؟';
	@override late final _TranslationsHomeCaesarAr caesar = _TranslationsHomeCaesarAr._(_root);
	@override late final _TranslationsHomeVigenereAr vigenere = _TranslationsHomeVigenereAr._(_root);
}

// Path: caesar
class _TranslationsCaesarAr implements TranslationsCaesarEn {
	_TranslationsCaesarAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'شفرة قيصر';
	@override String get inputLabel => 'رسالتك';
	@override String get inputHint => 'اكتب الرسالة التي تريد تشفيرها أو فك تشفيرها...';
	@override String get shiftLabel => 'حدد رقم القفل';
	@override String get encrypt => 'تشفير';
	@override String get decrypt => 'فك التشفير';
	@override String get bruteForce => 'لا تعرف رقم القفل؟';
	@override String get result => 'النتيجة';
	@override String get clearInput => 'مسح';
	@override String get copyResult => 'نسخ';
	@override String get copied => 'تم النسخ!';
	@override String get errorEmptyInput => 'يرجى كتابة رسالة أولاً.';
	@override String get errorInvalidInput => 'تحتوي رسالتك على أحرف لا تدعمها اللغة المختارة.';
	@override String get bruteForceTitle => 'جميع النتائج المحتملة';
	@override String get shiftPrefix => 'رقم القفل';
}

// Path: vigenere
class _TranslationsVigenereAr implements TranslationsVigenereEn {
	_TranslationsVigenereAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'شفرة فيجينير';
	@override String get inputLabel => 'رسالتك';
	@override String get inputHint => 'اكتب الرسالة التي تريد تشفيرها أو فك تشفيرها...';
	@override String get keyLabel => 'الكلمة السرية';
	@override String get keyHint => 'أدخل الكلمة السرية الخاصة بك (أحرف فقط)...';
	@override String get encrypt => 'تشفير';
	@override String get decrypt => 'فك التشفير';
	@override String get result => 'النتيجة';
	@override String get clearInput => 'مسح';
	@override String get copyResult => 'نسخ';
	@override String get copied => 'تم النسخ!';
	@override String get errorEmptyInput => 'يرجى كتابة رسالة أولاً.';
	@override String get errorEmptyKey => 'يرجى إدخال الكلمة السرية الخاصة بك.';
	@override String get errorInvalidInput => 'تحتوي رسالتك على أحرف لا تدعمها اللغة المختارة.';
	@override String get errorInvalidKey => 'الكلمة السرية يجب أن تحتوي على أحرف فقط.';
	@override String get tabulaRecta => 'جدول تطابق الأحرف';
	@override String get stepByStep => 'كيف تمّ القفل؟';
	@override String get stepTitleEncrypt => 'خطوات التشفير';
	@override String get stepTitleDecrypt => 'خطوات فك التشفير';
	@override String get stepRow => 'حرف من الكلمة السرية';
	@override String get stepCol => 'حرف من الرسالة';
	@override String get stepResult => 'الناتج';
	@override String get showTable => 'عرض الجدول';
	@override String get hideTable => 'إخفاء الجدول';
	@override String get animateResult => 'عرض خطوة بخطوة';
}

// Path: common
class _TranslationsCommonAr implements TranslationsCommonEn {
	_TranslationsCommonAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get english => 'الإنجليزية';
	@override String get arabic => 'العربية';
	@override String get darkMode => 'الوضع الداكن';
	@override String get lightMode => 'الوضع الفاتح';
	@override String get back => 'رجوع';
	@override String get launch => 'لنبدأ ←';
}

// Path: errors
class _TranslationsErrorsAr implements TranslationsErrorsEn {
	_TranslationsErrorsAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get cache => 'تعذّر حفظ إعداداتك.';
}

// Path: home.caesar
class _TranslationsHomeCaesarAr implements TranslationsHomeCaesarEn {
	_TranslationsHomeCaesarAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'شفرة قيصر';
	@override String get description => 'تقفل رسالتك باستخدام رقم — كل حرف ينتقل بعدد خطوات تحددها';
}

// Path: home.vigenere
class _TranslationsHomeVigenereAr implements TranslationsHomeVigenereEn {
	_TranslationsHomeVigenereAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'شفرة فيجينير';
	@override String get description => 'تقفل رسالتك باستخدام كلمة مرور — أصعب بكثير في الكسر من مجرد رقم';
}

/// The flat map containing all translations for locale <ar>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsAr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'CipherX',
			'splash.title' => 'مختبر الشفرات',
			'splash.tagline' => 'شفر رسالتك بأمان',
			'home.title' => 'مختبر الشفرات',
			'home.subtitle' => 'اختر طريقة لقفل رسالتك',
			'home.chooseCipher' => 'كيف تريد قفلها؟',
			'home.caesar.title' => 'شفرة قيصر',
			'home.caesar.description' => 'تقفل رسالتك باستخدام رقم — كل حرف ينتقل بعدد خطوات تحددها',
			'home.vigenere.title' => 'شفرة فيجينير',
			'home.vigenere.description' => 'تقفل رسالتك باستخدام كلمة مرور — أصعب بكثير في الكسر من مجرد رقم',
			'caesar.title' => 'شفرة قيصر',
			'caesar.inputLabel' => 'رسالتك',
			'caesar.inputHint' => 'اكتب الرسالة التي تريد تشفيرها أو فك تشفيرها...',
			'caesar.shiftLabel' => 'حدد رقم القفل',
			'caesar.encrypt' => 'تشفير',
			'caesar.decrypt' => 'فك التشفير',
			'caesar.bruteForce' => 'لا تعرف رقم القفل؟',
			'caesar.result' => 'النتيجة',
			'caesar.clearInput' => 'مسح',
			'caesar.copyResult' => 'نسخ',
			'caesar.copied' => 'تم النسخ!',
			'caesar.errorEmptyInput' => 'يرجى كتابة رسالة أولاً.',
			'caesar.errorInvalidInput' => 'تحتوي رسالتك على أحرف لا تدعمها اللغة المختارة.',
			'caesar.bruteForceTitle' => 'جميع النتائج المحتملة',
			'caesar.shiftPrefix' => 'رقم القفل',
			'vigenere.title' => 'شفرة فيجينير',
			'vigenere.inputLabel' => 'رسالتك',
			'vigenere.inputHint' => 'اكتب الرسالة التي تريد تشفيرها أو فك تشفيرها...',
			'vigenere.keyLabel' => 'الكلمة السرية',
			'vigenere.keyHint' => 'أدخل الكلمة السرية الخاصة بك (أحرف فقط)...',
			'vigenere.encrypt' => 'تشفير',
			'vigenere.decrypt' => 'فك التشفير',
			'vigenere.result' => 'النتيجة',
			'vigenere.clearInput' => 'مسح',
			'vigenere.copyResult' => 'نسخ',
			'vigenere.copied' => 'تم النسخ!',
			'vigenere.errorEmptyInput' => 'يرجى كتابة رسالة أولاً.',
			'vigenere.errorEmptyKey' => 'يرجى إدخال الكلمة السرية الخاصة بك.',
			'vigenere.errorInvalidInput' => 'تحتوي رسالتك على أحرف لا تدعمها اللغة المختارة.',
			'vigenere.errorInvalidKey' => 'الكلمة السرية يجب أن تحتوي على أحرف فقط.',
			'vigenere.tabulaRecta' => 'جدول تطابق الأحرف',
			'vigenere.stepByStep' => 'كيف تمّ القفل؟',
			'vigenere.stepTitleEncrypt' => 'خطوات التشفير',
			'vigenere.stepTitleDecrypt' => 'خطوات فك التشفير',
			'vigenere.stepRow' => 'حرف من الكلمة السرية',
			'vigenere.stepCol' => 'حرف من الرسالة',
			'vigenere.stepResult' => 'الناتج',
			'vigenere.showTable' => 'عرض الجدول',
			'vigenere.hideTable' => 'إخفاء الجدول',
			'vigenere.animateResult' => 'عرض خطوة بخطوة',
			'common.english' => 'الإنجليزية',
			'common.arabic' => 'العربية',
			'common.darkMode' => 'الوضع الداكن',
			'common.lightMode' => 'الوضع الفاتح',
			'common.back' => 'رجوع',
			'common.launch' => 'لنبدأ ←',
			'errors.cache' => 'تعذّر حفظ إعداداتك.',
			_ => null,
		};
	}
}
