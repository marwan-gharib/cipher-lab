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
	@override String get title => 'مختبر التشفير';
	@override String get tagline => 'أمن أفكارك';
}

// Path: home
class _TranslationsHomeAr implements TranslationsHomeEn {
	_TranslationsHomeAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'مختبر التشفير';
	@override String get subtitle => 'خوارزميات التشفير الكلاسيكية';
	@override String get chooseCipher => 'اختر خوارزمية';
	@override late final _TranslationsHomeCaesarAr caesar = _TranslationsHomeCaesarAr._(_root);
	@override late final _TranslationsHomeVigenereAr vigenere = _TranslationsHomeVigenereAr._(_root);
}

// Path: caesar
class _TranslationsCaesarAr implements TranslationsCaesarEn {
	_TranslationsCaesarAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'شفرة قيصر';
	@override String get inputLabel => 'النص (الأصلي أو المشفر)';
	@override String get inputHint => 'أدخل النص الذي ترغب في تشفيره أو فك تشفيره...';
	@override String get shiftLabel => 'مقدار الإزاحة';
	@override String get encrypt => 'تشفير';
	@override String get decrypt => 'فك التشفير';
	@override String get bruteForce => 'تجربة كل الاحتمالات';
	@override String get result => 'النتيجة';
	@override String get clearInput => 'مسح';
	@override String get copyResult => 'نسخ';
	@override String get copied => 'تم النسخ إلى الحافظة!';
	@override String get errorEmptyInput => 'الرجاء إدخال نص أولاً.';
	@override String get errorInvalidInput => 'المدخلات تحتوي على أحرف غير صالحة للغة المختارة.';
	@override String get bruteForceTitle => 'جميع التجارب الممكنة';
	@override String get shiftPrefix => 'إزاحة';
}

// Path: vigenere
class _TranslationsVigenereAr implements TranslationsVigenereEn {
	_TranslationsVigenereAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'شفرة فيجينير';
	@override String get inputLabel => 'النص (الأصلي أو المشفر)';
	@override String get inputHint => 'أدخل النص الذي ترغب في تشفيره أو فك تشفيره...';
	@override String get keyLabel => 'كلمة السر (المفتاح)';
	@override String get keyHint => 'أدخل كلمة السر (أحرف فقط)...';
	@override String get encrypt => 'تشفير';
	@override String get decrypt => 'فك التشفير';
	@override String get result => 'النتيجة';
	@override String get clearInput => 'مسح';
	@override String get copyResult => 'نسخ';
	@override String get copied => 'تم النسخ إلى الحافظة!';
	@override String get errorEmptyInput => 'الرجاء إدخال نص أولاً.';
	@override String get errorEmptyKey => 'الرجاء إدخال مفتاح التشفير.';
	@override String get errorInvalidInput => 'المدخلات تحتوي على أحرف غير صالحة للغة المختارة.';
	@override String get errorInvalidKey => 'كلمة السر تحتوي على أحرف غير صالحة للغة المختارة.';
	@override String get tabulaRecta => 'جدول مصفوفة فيجينير';
	@override String get stepByStep => 'خطوة بخطوة';
	@override String get stepTitleEncrypt => 'خطوات التشفير';
	@override String get stepTitleDecrypt => 'خطوات فك التشفير';
	@override String get stepRow => 'صف المفتاح';
	@override String get stepCol => 'عمود النص';
	@override String get stepResult => 'النتيجة';
	@override String get showTable => 'إظهار الجدول';
	@override String get hideTable => 'إخفاء الجدول';
	@override String get animateResult => 'عرض الخطوات تدريجياً';
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
	@override String get launch => 'ابدأ ←';
}

// Path: home.caesar
class _TranslationsHomeCaesarAr implements TranslationsHomeCaesarEn {
	_TranslationsHomeCaesarAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'شفرة قيصر';
	@override String get description => 'تشفير يعتمد على إزاحة حروف الأبجدية بمقدار ثابت';
}

// Path: home.vigenere
class _TranslationsHomeVigenereAr implements TranslationsHomeVigenereEn {
	_TranslationsHomeVigenereAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'شفرة فيجينير';
	@override String get description => 'تشفير متعدد الأبجديات يستخدم كلمة سر لتغيير نمط التشفير';
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
			'splash.title' => 'مختبر التشفير',
			'splash.tagline' => 'أمن أفكارك',
			'home.title' => 'مختبر التشفير',
			'home.subtitle' => 'خوارزميات التشفير الكلاسيكية',
			'home.chooseCipher' => 'اختر خوارزمية',
			'home.caesar.title' => 'شفرة قيصر',
			'home.caesar.description' => 'تشفير يعتمد على إزاحة حروف الأبجدية بمقدار ثابت',
			'home.vigenere.title' => 'شفرة فيجينير',
			'home.vigenere.description' => 'تشفير متعدد الأبجديات يستخدم كلمة سر لتغيير نمط التشفير',
			'caesar.title' => 'شفرة قيصر',
			'caesar.inputLabel' => 'النص (الأصلي أو المشفر)',
			'caesar.inputHint' => 'أدخل النص الذي ترغب في تشفيره أو فك تشفيره...',
			'caesar.shiftLabel' => 'مقدار الإزاحة',
			'caesar.encrypt' => 'تشفير',
			'caesar.decrypt' => 'فك التشفير',
			'caesar.bruteForce' => 'تجربة كل الاحتمالات',
			'caesar.result' => 'النتيجة',
			'caesar.clearInput' => 'مسح',
			'caesar.copyResult' => 'نسخ',
			'caesar.copied' => 'تم النسخ إلى الحافظة!',
			'caesar.errorEmptyInput' => 'الرجاء إدخال نص أولاً.',
			'caesar.errorInvalidInput' => 'المدخلات تحتوي على أحرف غير صالحة للغة المختارة.',
			'caesar.bruteForceTitle' => 'جميع التجارب الممكنة',
			'caesar.shiftPrefix' => 'إزاحة',
			'vigenere.title' => 'شفرة فيجينير',
			'vigenere.inputLabel' => 'النص (الأصلي أو المشفر)',
			'vigenere.inputHint' => 'أدخل النص الذي ترغب في تشفيره أو فك تشفيره...',
			'vigenere.keyLabel' => 'كلمة السر (المفتاح)',
			'vigenere.keyHint' => 'أدخل كلمة السر (أحرف فقط)...',
			'vigenere.encrypt' => 'تشفير',
			'vigenere.decrypt' => 'فك التشفير',
			'vigenere.result' => 'النتيجة',
			'vigenere.clearInput' => 'مسح',
			'vigenere.copyResult' => 'نسخ',
			'vigenere.copied' => 'تم النسخ إلى الحافظة!',
			'vigenere.errorEmptyInput' => 'الرجاء إدخال نص أولاً.',
			'vigenere.errorEmptyKey' => 'الرجاء إدخال مفتاح التشفير.',
			'vigenere.errorInvalidInput' => 'المدخلات تحتوي على أحرف غير صالحة للغة المختارة.',
			'vigenere.errorInvalidKey' => 'كلمة السر تحتوي على أحرف غير صالحة للغة المختارة.',
			'vigenere.tabulaRecta' => 'جدول مصفوفة فيجينير',
			'vigenere.stepByStep' => 'خطوة بخطوة',
			'vigenere.stepTitleEncrypt' => 'خطوات التشفير',
			'vigenere.stepTitleDecrypt' => 'خطوات فك التشفير',
			'vigenere.stepRow' => 'صف المفتاح',
			'vigenere.stepCol' => 'عمود النص',
			'vigenere.stepResult' => 'النتيجة',
			'vigenere.showTable' => 'إظهار الجدول',
			'vigenere.hideTable' => 'إخفاء الجدول',
			'vigenere.animateResult' => 'عرض الخطوات تدريجياً',
			'common.english' => 'الإنجليزية',
			'common.arabic' => 'العربية',
			'common.darkMode' => 'الوضع الداكن',
			'common.lightMode' => 'الوضع الفاتح',
			'common.back' => 'رجوع',
			'common.launch' => 'ابدأ ←',
			_ => null,
		};
	}
}
