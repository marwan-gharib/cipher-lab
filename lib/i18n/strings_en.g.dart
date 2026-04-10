///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsAppEn app = TranslationsAppEn._(_root);
	late final TranslationsHomeEn home = TranslationsHomeEn._(_root);
	late final TranslationsCaesarEn caesar = TranslationsCaesarEn._(_root);
	late final TranslationsVigenereEn vigenere = TranslationsVigenereEn._(_root);
	late final TranslationsCommonEn common = TranslationsCommonEn._(_root);
}

// Path: app
class TranslationsAppEn {
	TranslationsAppEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'CipherX'
	String get title => 'CipherX';
}

// Path: home
class TranslationsHomeEn {
	TranslationsHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Encryption Lab'
	String get title => 'Encryption Lab';

	/// en: 'Classical Cipher Algorithms'
	String get subtitle => 'Classical Cipher Algorithms';

	/// en: 'Choose an Algorithm'
	String get chooseCipher => 'Choose an Algorithm';

	late final TranslationsHomeCaesarEn caesar = TranslationsHomeCaesarEn._(_root);
	late final TranslationsHomeVigenereEn vigenere = TranslationsHomeVigenereEn._(_root);
}

// Path: caesar
class TranslationsCaesarEn {
	TranslationsCaesarEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Caesar Cipher'
	String get title => 'Caesar Cipher';

	/// en: 'Plaintext / Ciphertext'
	String get inputLabel => 'Plaintext / Ciphertext';

	/// en: 'Enter text to encrypt or decrypt...'
	String get inputHint => 'Enter text to encrypt or decrypt...';

	/// en: 'Shift Value'
	String get shiftLabel => 'Shift Value';

	/// en: 'Encrypt'
	String get encrypt => 'Encrypt';

	/// en: 'Decrypt'
	String get decrypt => 'Decrypt';

	/// en: 'Brute Force'
	String get bruteForce => 'Brute Force';

	/// en: 'Result'
	String get result => 'Result';

	/// en: 'Clear'
	String get clearInput => 'Clear';

	/// en: 'Copy'
	String get copyResult => 'Copy';

	/// en: 'Copied to clipboard!'
	String get copied => 'Copied to clipboard!';

	/// en: 'Please enter some text first.'
	String get errorEmptyInput => 'Please enter some text first.';

	/// en: 'Input contains invalid characters for selected language.'
	String get errorInvalidInput => 'Input contains invalid characters for selected language.';

	/// en: 'All Possible Shifts'
	String get bruteForceTitle => 'All Possible Shifts';

	/// en: 'Shift'
	String get shiftPrefix => 'Shift';
}

// Path: vigenere
class TranslationsVigenereEn {
	TranslationsVigenereEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Vigenère Cipher'
	String get title => 'Vigenère Cipher';

	/// en: 'Plaintext / Ciphertext'
	String get inputLabel => 'Plaintext / Ciphertext';

	/// en: 'Enter text to encrypt or decrypt...'
	String get inputHint => 'Enter text to encrypt or decrypt...';

	/// en: 'Encryption Key'
	String get keyLabel => 'Encryption Key';

	/// en: 'Enter key (letters only)...'
	String get keyHint => 'Enter key (letters only)...';

	/// en: 'Encrypt'
	String get encrypt => 'Encrypt';

	/// en: 'Decrypt'
	String get decrypt => 'Decrypt';

	/// en: 'Result'
	String get result => 'Result';

	/// en: 'Clear'
	String get clearInput => 'Clear';

	/// en: 'Copy'
	String get copyResult => 'Copy';

	/// en: 'Copied to clipboard!'
	String get copied => 'Copied to clipboard!';

	/// en: 'Please enter some text first.'
	String get errorEmptyInput => 'Please enter some text first.';

	/// en: 'Please enter an encryption key.'
	String get errorEmptyKey => 'Please enter an encryption key.';

	/// en: 'Input contains invalid characters for selected language.'
	String get errorInvalidInput => 'Input contains invalid characters for selected language.';

	/// en: 'Key contains invalid characters for selected language.'
	String get errorInvalidKey => 'Key contains invalid characters for selected language.';

	/// en: 'Tabula Recta'
	String get tabulaRecta => 'Tabula Recta';

	/// en: 'Step-by-Step'
	String get stepByStep => 'Step-by-Step';

	/// en: 'Encryption Steps'
	String get stepTitleEncrypt => 'Encryption Steps';

	/// en: 'Decryption Steps'
	String get stepTitleDecrypt => 'Decryption Steps';

	/// en: 'Key Row'
	String get stepRow => 'Key Row';

	/// en: 'Text Column'
	String get stepCol => 'Text Column';

	/// en: 'Result'
	String get stepResult => 'Result';

	/// en: 'Show Table'
	String get showTable => 'Show Table';

	/// en: 'Hide Table'
	String get hideTable => 'Hide Table';

	/// en: 'Animate steps'
	String get animateResult => 'Animate steps';
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'English'
	String get english => 'English';

	/// en: 'Arabic'
	String get arabic => 'Arabic';

	/// en: 'Dark Mode'
	String get darkMode => 'Dark Mode';

	/// en: 'Light Mode'
	String get lightMode => 'Light Mode';

	/// en: 'Back'
	String get back => 'Back';

	/// en: 'Launch →'
	String get launch => 'Launch →';
}

// Path: home.caesar
class TranslationsHomeCaesarEn {
	TranslationsHomeCaesarEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Caesar Cipher'
	String get title => 'Caesar Cipher';

	/// en: 'Single-shift substitution cipher using alphabet rotation'
	String get description => 'Single-shift substitution cipher using alphabet rotation';
}

// Path: home.vigenere
class TranslationsHomeVigenereEn {
	TranslationsHomeVigenereEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Vigenère Cipher'
	String get title => 'Vigenère Cipher';

	/// en: 'Polyalphabetic cipher using a 2D Tabula Recta matrix'
	String get description => 'Polyalphabetic cipher using a 2D Tabula Recta matrix';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'CipherX',
			'home.title' => 'Encryption Lab',
			'home.subtitle' => 'Classical Cipher Algorithms',
			'home.chooseCipher' => 'Choose an Algorithm',
			'home.caesar.title' => 'Caesar Cipher',
			'home.caesar.description' => 'Single-shift substitution cipher using alphabet rotation',
			'home.vigenere.title' => 'Vigenère Cipher',
			'home.vigenere.description' => 'Polyalphabetic cipher using a 2D Tabula Recta matrix',
			'caesar.title' => 'Caesar Cipher',
			'caesar.inputLabel' => 'Plaintext / Ciphertext',
			'caesar.inputHint' => 'Enter text to encrypt or decrypt...',
			'caesar.shiftLabel' => 'Shift Value',
			'caesar.encrypt' => 'Encrypt',
			'caesar.decrypt' => 'Decrypt',
			'caesar.bruteForce' => 'Brute Force',
			'caesar.result' => 'Result',
			'caesar.clearInput' => 'Clear',
			'caesar.copyResult' => 'Copy',
			'caesar.copied' => 'Copied to clipboard!',
			'caesar.errorEmptyInput' => 'Please enter some text first.',
			'caesar.errorInvalidInput' => 'Input contains invalid characters for selected language.',
			'caesar.bruteForceTitle' => 'All Possible Shifts',
			'caesar.shiftPrefix' => 'Shift',
			'vigenere.title' => 'Vigenère Cipher',
			'vigenere.inputLabel' => 'Plaintext / Ciphertext',
			'vigenere.inputHint' => 'Enter text to encrypt or decrypt...',
			'vigenere.keyLabel' => 'Encryption Key',
			'vigenere.keyHint' => 'Enter key (letters only)...',
			'vigenere.encrypt' => 'Encrypt',
			'vigenere.decrypt' => 'Decrypt',
			'vigenere.result' => 'Result',
			'vigenere.clearInput' => 'Clear',
			'vigenere.copyResult' => 'Copy',
			'vigenere.copied' => 'Copied to clipboard!',
			'vigenere.errorEmptyInput' => 'Please enter some text first.',
			'vigenere.errorEmptyKey' => 'Please enter an encryption key.',
			'vigenere.errorInvalidInput' => 'Input contains invalid characters for selected language.',
			'vigenere.errorInvalidKey' => 'Key contains invalid characters for selected language.',
			'vigenere.tabulaRecta' => 'Tabula Recta',
			'vigenere.stepByStep' => 'Step-by-Step',
			'vigenere.stepTitleEncrypt' => 'Encryption Steps',
			'vigenere.stepTitleDecrypt' => 'Decryption Steps',
			'vigenere.stepRow' => 'Key Row',
			'vigenere.stepCol' => 'Text Column',
			'vigenere.stepResult' => 'Result',
			'vigenere.showTable' => 'Show Table',
			'vigenere.hideTable' => 'Hide Table',
			'vigenere.animateResult' => 'Animate steps',
			'common.english' => 'English',
			'common.arabic' => 'Arabic',
			'common.darkMode' => 'Dark Mode',
			'common.lightMode' => 'Light Mode',
			'common.back' => 'Back',
			'common.launch' => 'Launch →',
			_ => null,
		};
	}
}
