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
	@override String get inputLabel => 'النص العادي / المشفر';
	@override String get inputHint => 'أدخل النص للتشفير أو فك التشفير...';
	@override String get shiftLabel => 'قيمة الإزاحة';
	@override String get encrypt => 'تشفير';
	@override String get decrypt => 'فك التشفير';
	@override String get bruteForce => 'القوة الغاشمة';
	@override String get result => 'النتيجة';
	@override String get clearInput => 'مسح';
	@override String get copyResult => 'نسخ';
	@override String get copied => 'تم النسخ إلى الحافظة!';
	@override String get errorEmptyInput => 'الرجاء إدخال نص أولاً.';
	@override String get errorInvalidInput => 'المدخلات تحتوي على أحرف غير صالحة للغة المختارة.';
	@override String get bruteForceTitle => 'جميع الإزاحات الممكنة';
	@override String get shiftPrefix => 'إزاحة';
}

// Path: vigenere
class _TranslationsVigenereAr implements TranslationsVigenereEn {
	_TranslationsVigenereAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'شفرة فيجينير';
	@override String get inputLabel => 'النص العادي / المشفر';
	@override String get inputHint => 'أدخل النص للتشفير أو فك التشفير...';
	@override String get keyLabel => 'مفتاح التشفير';
	@override String get keyHint => 'أدخل المفتاح (أحرف فقط)...';
	@override String get encrypt => 'تشفير';
	@override String get decrypt => 'فك التشفير';
	@override String get result => 'النتيجة';
	@override String get clearInput => 'مسح';
	@override String get copyResult => 'نسخ';
	@override String get copied => 'تم النسخ إلى الحافظة!';
	@override String get errorEmptyInput => 'الرجاء إدخال نص أولاً.';
	@override String get errorEmptyKey => 'الرجاء إدخال مفتاح التشفير.';
	@override String get errorInvalidInput => 'المدخلات تحتوي على أحرف غير صالحة للغة المختارة.';
	@override String get errorInvalidKey => 'المفتاح يحتوي على أحرف غير صالحة للغة المختارة.';
	@override String get tabulaRecta => 'مصفوفة تابولا ريكتا';
	@override String get stepByStep => 'خطوة بخطوة';
	@override String get stepTitle => 'خطوات التشفير';
	@override String get stepRow => 'صف المفتاح';
	@override String get stepCol => 'عمود النص';
	@override String get stepResult => 'النتيجة';
	@override String get showTable => 'إظهار الجدول';
	@override String get hideTable => 'إخفاء الجدول';
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
	@override String get description => 'تشفير الاستبدال أحادي الإزاحة باستخدام تدوير الأبجدية';
}

// Path: home.vigenere
class _TranslationsHomeVigenereAr implements TranslationsHomeVigenereEn {
	_TranslationsHomeVigenereAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'شفرة فيجينير';
	@override String get description => 'تشفير متعدد الأبجديات باستخدام مصفوفة Tabula Recta ثنائية الأبعاد';
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
			'home.title' => 'مختبر التشفير',
			'home.subtitle' => 'خوارزميات التشفير الكلاسيكية',
			'home.chooseCipher' => 'اختر خوارزمية',
			'home.caesar.title' => 'شفرة قيصر',
			'home.caesar.description' => 'تشفير الاستبدال أحادي الإزاحة باستخدام تدوير الأبجدية',
			'home.vigenere.title' => 'شفرة فيجينير',
			'home.vigenere.description' => 'تشفير متعدد الأبجديات باستخدام مصفوفة Tabula Recta ثنائية الأبعاد',
			'caesar.title' => 'شفرة قيصر',
			'caesar.inputLabel' => 'النص العادي / المشفر',
			'caesar.inputHint' => 'أدخل النص للتشفير أو فك التشفير...',
			'caesar.shiftLabel' => 'قيمة الإزاحة',
			'caesar.encrypt' => 'تشفير',
			'caesar.decrypt' => 'فك التشفير',
			'caesar.bruteForce' => 'القوة الغاشمة',
			'caesar.result' => 'النتيجة',
			'caesar.clearInput' => 'مسح',
			'caesar.copyResult' => 'نسخ',
			'caesar.copied' => 'تم النسخ إلى الحافظة!',
			'caesar.errorEmptyInput' => 'الرجاء إدخال نص أولاً.',
			'caesar.errorInvalidInput' => 'المدخلات تحتوي على أحرف غير صالحة للغة المختارة.',
			'caesar.bruteForceTitle' => 'جميع الإزاحات الممكنة',
			'caesar.shiftPrefix' => 'إزاحة',
			'vigenere.title' => 'شفرة فيجينير',
			'vigenere.inputLabel' => 'النص العادي / المشفر',
			'vigenere.inputHint' => 'أدخل النص للتشفير أو فك التشفير...',
			'vigenere.keyLabel' => 'مفتاح التشفير',
			'vigenere.keyHint' => 'أدخل المفتاح (أحرف فقط)...',
			'vigenere.encrypt' => 'تشفير',
			'vigenere.decrypt' => 'فك التشفير',
			'vigenere.result' => 'النتيجة',
			'vigenere.clearInput' => 'مسح',
			'vigenere.copyResult' => 'نسخ',
			'vigenere.copied' => 'تم النسخ إلى الحافظة!',
			'vigenere.errorEmptyInput' => 'الرجاء إدخال نص أولاً.',
			'vigenere.errorEmptyKey' => 'الرجاء إدخال مفتاح التشفير.',
			'vigenere.errorInvalidInput' => 'المدخلات تحتوي على أحرف غير صالحة للغة المختارة.',
			'vigenere.errorInvalidKey' => 'المفتاح يحتوي على أحرف غير صالحة للغة المختارة.',
			'vigenere.tabulaRecta' => 'مصفوفة تابولا ريكتا',
			'vigenere.stepByStep' => 'خطوة بخطوة',
			'vigenere.stepTitle' => 'خطوات التشفير',
			'vigenere.stepRow' => 'صف المفتاح',
			'vigenere.stepCol' => 'عمود النص',
			'vigenere.stepResult' => 'النتيجة',
			'vigenere.showTable' => 'إظهار الجدول',
			'vigenere.hideTable' => 'إخفاء الجدول',
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
