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
	late final TranslationsSplashEn splash = TranslationsSplashEn._(_root);
	late final TranslationsHomeEn home = TranslationsHomeEn._(_root);
	late final TranslationsCaesarEn caesar = TranslationsCaesarEn._(_root);
	late final TranslationsVigenereEn vigenere = TranslationsVigenereEn._(_root);
	late final TranslationsCommonEn common = TranslationsCommonEn._(_root);
	late final TranslationsErrorsEn errors = TranslationsErrorsEn._(_root);
}

// Path: app
class TranslationsAppEn {
	TranslationsAppEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'CipherX'
	String get title => 'CipherX';
}

// Path: splash
class TranslationsSplashEn {
	TranslationsSplashEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'CIPHER LAB'
	String get title => 'CIPHER LAB';

	/// en: 'Secure Your Thoughts'
	String get tagline => 'Secure Your Thoughts';
}

// Path: home
class TranslationsHomeEn {
	TranslationsHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Encryption Lab'
	String get title => 'Encryption Lab';

	/// en: 'Pick a way to lock your message'
	String get subtitle => 'Pick a way to lock your message';

	/// en: 'How do you want to lock it?'
	String get chooseCipher => 'How do you want to lock it?';

	late final TranslationsHomeCaesarEn caesar = TranslationsHomeCaesarEn._(_root);
	late final TranslationsHomeVigenereEn vigenere = TranslationsHomeVigenereEn._(_root);
}

// Path: caesar
class TranslationsCaesarEn {
	TranslationsCaesarEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Caesar Code'
	String get title => 'Caesar Code';

	/// en: 'Your Message'
	String get inputLabel => 'Your Message';

	/// en: 'Type the message you want to encrypt or decrypt...'
	String get inputHint => 'Type the message you want to encrypt or decrypt...';

	/// en: 'Select Lock Number'
	String get shiftLabel => 'Select Lock Number';

	/// en: 'Encrypt'
	String get encrypt => 'Encrypt';

	/// en: 'Decrypt'
	String get decrypt => 'Decrypt';

	/// en: 'Don't Know the Number?'
	String get bruteForce => 'Don\'t Know the Number?';

	/// en: 'Result'
	String get result => 'Result';

	/// en: 'Clear'
	String get clearInput => 'Clear';

	/// en: 'Copy'
	String get copyResult => 'Copy';

	/// en: 'Copied!'
	String get copied => 'Copied!';

	/// en: 'Please type a message first.'
	String get errorEmptyInput => 'Please type a message first.';

	/// en: 'Your message has characters that don't work with the selected language.'
	String get errorInvalidInput => 'Your message has characters that don\'t work with the selected language.';

	/// en: 'All Possible Results'
	String get bruteForceTitle => 'All Possible Results';

	/// en: 'Lock No.'
	String get shiftPrefix => 'Lock No.';
}

// Path: vigenere
class TranslationsVigenereEn {
	TranslationsVigenereEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Vigenère Code'
	String get title => 'Vigenère Code';

	/// en: 'Your Message'
	String get inputLabel => 'Your Message';

	/// en: 'Type the message you want to encrypt or decrypt...'
	String get inputHint => 'Type the message you want to encrypt or decrypt...';

	/// en: 'Secret Word'
	String get keyLabel => 'Secret Word';

	/// en: 'Enter your secret word (letters only)...'
	String get keyHint => 'Enter your secret word (letters only)...';

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

	/// en: 'Copied!'
	String get copied => 'Copied!';

	/// en: 'Please type a message first.'
	String get errorEmptyInput => 'Please type a message first.';

	/// en: 'Please enter your secret word.'
	String get errorEmptyKey => 'Please enter your secret word.';

	/// en: 'Your message has characters that don't work with the selected language.'
	String get errorInvalidInput => 'Your message has characters that don\'t work with the selected language.';

	/// en: 'Secret word must contains only letters.'
	String get errorInvalidKey => 'Secret word must contains only letters.';

	/// en: 'Letter Matching Table'
	String get tabulaRecta => 'Letter Matching Table';

	/// en: 'How was it locked?'
	String get stepByStep => 'How was it locked?';

	/// en: 'Encryption Steps'
	String get stepTitleEncrypt => 'Encryption Steps';

	/// en: 'Decryption Steps'
	String get stepTitleDecrypt => 'Decryption Steps';

	/// en: 'Secret Word Letter'
	String get stepRow => 'Secret Word Letter';

	/// en: 'Message Letter'
	String get stepCol => 'Message Letter';

	/// en: 'Output'
	String get stepResult => 'Output';

	/// en: 'Show Table'
	String get showTable => 'Show Table';

	/// en: 'Hide Table'
	String get hideTable => 'Hide Table';

	/// en: 'Show step by step'
	String get animateResult => 'Show step by step';
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

	/// en: 'Let's Go →'
	String get launch => 'Let\'s Go →';
}

// Path: errors
class TranslationsErrorsEn {
	TranslationsErrorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Couldn't save your preferences.'
	String get cache => 'Couldn\'t save your preferences.';
}

// Path: home.caesar
class TranslationsHomeCaesarEn {
	TranslationsHomeCaesarEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Caesar Code'
	String get title => 'Caesar Code';

	/// en: 'Locks your message using a number — each letter shifts by that many steps'
	String get description => 'Locks your message using a number — each letter shifts by that many steps';
}

// Path: home.vigenere
class TranslationsHomeVigenereEn {
	TranslationsHomeVigenereEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Vigenère Code'
	String get title => 'Vigenère Code';

	/// en: 'Locks your message using a secret word — much harder to crack than a number'
	String get description => 'Locks your message using a secret word — much harder to crack than a number';
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
			'splash.title' => 'CIPHER LAB',
			'splash.tagline' => 'Secure Your Thoughts',
			'home.title' => 'Encryption Lab',
			'home.subtitle' => 'Pick a way to lock your message',
			'home.chooseCipher' => 'How do you want to lock it?',
			'home.caesar.title' => 'Caesar Code',
			'home.caesar.description' => 'Locks your message using a number — each letter shifts by that many steps',
			'home.vigenere.title' => 'Vigenère Code',
			'home.vigenere.description' => 'Locks your message using a secret word — much harder to crack than a number',
			'caesar.title' => 'Caesar Code',
			'caesar.inputLabel' => 'Your Message',
			'caesar.inputHint' => 'Type the message you want to encrypt or decrypt...',
			'caesar.shiftLabel' => 'Select Lock Number',
			'caesar.encrypt' => 'Encrypt',
			'caesar.decrypt' => 'Decrypt',
			'caesar.bruteForce' => 'Don\'t Know the Number?',
			'caesar.result' => 'Result',
			'caesar.clearInput' => 'Clear',
			'caesar.copyResult' => 'Copy',
			'caesar.copied' => 'Copied!',
			'caesar.errorEmptyInput' => 'Please type a message first.',
			'caesar.errorInvalidInput' => 'Your message has characters that don\'t work with the selected language.',
			'caesar.bruteForceTitle' => 'All Possible Results',
			'caesar.shiftPrefix' => 'Lock No.',
			'vigenere.title' => 'Vigenère Code',
			'vigenere.inputLabel' => 'Your Message',
			'vigenere.inputHint' => 'Type the message you want to encrypt or decrypt...',
			'vigenere.keyLabel' => 'Secret Word',
			'vigenere.keyHint' => 'Enter your secret word (letters only)...',
			'vigenere.encrypt' => 'Encrypt',
			'vigenere.decrypt' => 'Decrypt',
			'vigenere.result' => 'Result',
			'vigenere.clearInput' => 'Clear',
			'vigenere.copyResult' => 'Copy',
			'vigenere.copied' => 'Copied!',
			'vigenere.errorEmptyInput' => 'Please type a message first.',
			'vigenere.errorEmptyKey' => 'Please enter your secret word.',
			'vigenere.errorInvalidInput' => 'Your message has characters that don\'t work with the selected language.',
			'vigenere.errorInvalidKey' => 'Secret word must contains only letters.',
			'vigenere.tabulaRecta' => 'Letter Matching Table',
			'vigenere.stepByStep' => 'How was it locked?',
			'vigenere.stepTitleEncrypt' => 'Encryption Steps',
			'vigenere.stepTitleDecrypt' => 'Decryption Steps',
			'vigenere.stepRow' => 'Secret Word Letter',
			'vigenere.stepCol' => 'Message Letter',
			'vigenere.stepResult' => 'Output',
			'vigenere.showTable' => 'Show Table',
			'vigenere.hideTable' => 'Hide Table',
			'vigenere.animateResult' => 'Show step by step',
			'common.english' => 'English',
			'common.arabic' => 'Arabic',
			'common.darkMode' => 'Dark Mode',
			'common.lightMode' => 'Light Mode',
			'common.back' => 'Back',
			'common.launch' => 'Let\'s Go →',
			'errors.cache' => 'Couldn\'t save your preferences.',
			_ => null,
		};
	}
}
