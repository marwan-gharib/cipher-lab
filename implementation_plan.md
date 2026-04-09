# Multi-Language Caesar & Vigenère Encryption App

A production-level Flutter app demonstrating classical encryption with full English/Arabic support, 2D matrix visualization, and a premium cybersecurity-themed UI.

## User Review Required

> [!IMPORTANT]
> **Localization Approach:** Using **`slang`** (the most popular modern type-safe localization in 2026) instead of the `flutter_localizations + intl + ARB` approach mentioned in `flutter_ai_guidelines.md`, as explicitly requested by the user. Slang provides type-safe translations, code generation, and a cleaner developer experience.

> [!IMPORTANT]  
> **No Network/Database Layer:** This app is purely local (no API calls, no local DB). Layers like `core/network/`, `core/local/`, `data/datasources/remote/` are **omitted** intentionally. The guidelines say to follow existing patterns — since there's no backend, these layers don't apply.

> [!WARNING]
> **No `fpdart` / `Either` usage:** Since there are no remote calls or I/O operations that can fail with different failure types, using `Either<Failure, Success>` would be over-engineering. Encryption logic is pure computation — errors are handled via input validation at the UI level with SnackBar messages.

---

## Architecture Overview

```
lib/
├── core/
│   ├── constants/
│   │   └── app_constants.dart
│   ├── di/
│   │   └── service_locator.dart
│   ├── routing/
│   │   ├── app_router.dart
│   │   └── routes.dart
│   ├── shared/
│   │   ├── cubits/
│   │   │   └── locale/
│   │   │       ├── locale_cubit.dart
│   │   │       └── locale_state.dart
│   │   ├── domain/
│   │   │   └── enums/
│   │   │       ├── app_language.dart
│   │   │       └── cipher_type.dart
│   │   ├── presentation/
│   │   │   └── widgets/
│   │   │       ├── animated_gradient_background.dart
│   │   │       ├── glassmorphic_container.dart
│   │   │       ├── neon_button.dart
│   │   │       ├── neon_text_field.dart
│   │   │       └── language_toggle_button.dart
│   │   └── utils/
│   │       ├── input_validators.dart
│   │       └── extensions/
│   │           └── context_extensions.dart
│   └── theme/
│       ├── app_colors.dart
│       ├── app_text_styles.dart
│       ├── app_spacing.dart
│       ├── app_radius.dart
│       ├── app_theme.dart
│       ├── cubit/
│       │   ├── theme_cubit.dart
│       │   └── theme_state.dart
│       └── modes/
│           ├── light.dart
│           └── dark.dart
│
├── features/
│   ├── home/
│   │   ├── di/
│   │   │   └── home_di.dart
│   │   └── presentation/
│   │       ├── screens/
│   │       │   └── home_screen.dart
│   │       └── widgets/
│   │           ├── cipher_selection_card.dart
│   │           └── animated_title.dart
│   │
│   ├── caesar/
│   │   ├── di/
│   │   │   └── caesar_di.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── caesar_result.dart
│   │   │   └── usecases/
│   │   │       ├── caesar_encrypt_usecase.dart
│   │   │       ├── caesar_decrypt_usecase.dart
│   │   │       └── caesar_brute_force_usecase.dart
│   │   └── presentation/
│   │       ├── cubits/
│   │       │   └── caesar/
│   │       │       ├── caesar_cubit.dart
│   │       │       └── caesar_state.dart
│   │       ├── screens/
│   │       │   └── caesar_screen.dart
│   │       └── widgets/
│   │           ├── caesar_input_section.dart
│   │           ├── caesar_shift_slider.dart
│   │           ├── caesar_result_display.dart
│   │           ├── caesar_brute_force_results.dart
│   │           └── caesar_animated_letter.dart
│   │
│   └── vigenere/
│       ├── di/
│       │   └── vigenere_di.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   ├── vigenere_result.dart
│       │   │   └── vigenere_step.dart
│       │   └── usecases/
│       │       ├── vigenere_encrypt_usecase.dart
│       │       ├── vigenere_decrypt_usecase.dart
│       │       └── build_tabula_recta_usecase.dart
│       └── presentation/
│           ├── cubits/
│           │   └── vigenere/
│           │       ├── vigenere_cubit.dart
│           │       └── vigenere_state.dart
│           ├── screens/
│           │   └── vigenere_screen.dart
│           └── widgets/
│               ├── vigenere_input_section.dart
│               ├── vigenere_key_input.dart
│               ├── vigenere_result_display.dart
│               ├── tabula_recta_table.dart
│               ├── tabula_recta_cell.dart
│               └── vigenere_step_visualizer.dart
│
├── i18n/
│   ├── strings.i18n.json          (English — template)
│   └── strings_ar.i18n.json       (Arabic)
│
└── main.dart
```

---

## Proposed Changes

### Core — Constants

#### [NEW] [app_constants.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/core/constants/app_constants.dart)
- English alphabet: `A-Z` (26 letters)
- Arabic alphabet: 28 letters (ا ب ت ث ج ح خ د ذ ر ز س ش ص ض ط ظ ع غ ف ق ك ل م ن ه و ي)
- Animation durations, max shift values

---

### Core — Theme (Cybersecurity / Neon)

#### [NEW] [app_colors.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/core/theme/app_colors.dart)
- Dark base: `#0A0E21`, `#1A1A2E`
- Neon accents: cyan `#00F5FF`, purple `#BD00FF`, green `#39FF14`
- Glassmorphism: semi-transparent whites/blacks
- Surface colors, error, success states

#### [NEW] [app_text_styles.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/core/theme/app_text_styles.dart)
- Uses Google Fonts: `Orbitron` for headings (cyber feel), `JetBrains Mono` for cipher text, `Inter` for body

#### [NEW] [app_spacing.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/core/theme/app_spacing.dart)
- Standard spacing scale: xs(4), sm(8), md(16), lg(24), xl(32), xxl(48)

#### [NEW] [app_radius.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/core/theme/app_radius.dart)
- Standard radius scale: sm(8), md(12), lg(16), xl(24)

#### [NEW] [app_theme.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/core/theme/app_theme.dart)
- Builds `ThemeData` from colors, text styles, component themes

#### [NEW] [dark.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/core/theme/modes/dark.dart) / [light.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/core/theme/modes/light.dart)
- Dark mode is primary (cybersecurity theme), light mode as alternative

#### [NEW] [theme_cubit.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/core/theme/cubit/theme_cubit.dart) / [theme_state.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/core/theme/cubit/theme_state.dart)
- Toggle dark/light mode, persist preference (in-memory for now)

---

### Core — Shared (cubits, domain, presentation, utils)

#### [NEW] [locale_cubit.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/core/shared/cubits/locale/locale_cubit.dart) / [locale_state.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/core/shared/cubits/locale/locale_state.dart)
- Manages `AppLanguage` selection (English/Arabic)
- Emits new state on toggle → triggers locale change in `TranslationProvider`
- Drives encryption logic language and input validation

#### [NEW] [app_language.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/core/shared/domain/enums/app_language.dart)
- `enum AppLanguage { english, arabic }` with helper getters for alphabet, length, locale

#### [NEW] [cipher_type.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/core/shared/domain/enums/cipher_type.dart)
- `enum CipherType { caesar, vigenere }`

#### [NEW] [glassmorphic_container.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/core/shared/presentation/widgets/glassmorphic_container.dart)
- Frosted glass effect with `BackdropFilter`, blur, gradient borders

#### [NEW] [neon_button.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/core/shared/presentation/widgets/neon_button.dart)
- Glowing neon button with pulse animation, customizable glow color

#### [NEW] [neon_text_field.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/core/shared/presentation/widgets/neon_text_field.dart)
- Custom text field with neon border glow on focus, language-aware input filtering

#### [NEW] [animated_gradient_background.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/core/shared/presentation/widgets/animated_gradient_background.dart)
- Animated dark gradient background with subtle particle effect

#### [NEW] [language_toggle_button.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/core/shared/presentation/widgets/language_toggle_button.dart)
- EN/AR toggle with animated flip effect

#### [NEW] [input_validators.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/core/shared/utils/input_validators.dart)
- `isValidEnglishInput(String)` — accepts only A-Z, a-z
- `isValidArabicInput(String)` — accepts only \u0600-\u06FF
- `InputFormatter` classes for TextFields to restrict input dynamically

#### [NEW] [context_extensions.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/core/shared/utils/extensions/context_extensions.dart)
- Extension on `BuildContext` for common operations

---

### Core — Routing

#### [NEW] [routes.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/core/routing/routes.dart)
- `/` → home, `/caesar` → Caesar screen, `/vigenere` → Vigenère screen

#### [NEW] [app_router.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/core/routing/app_router.dart)
- `GoRouter` setup with BlocProvider injection at route level

---

### Core — DI

#### [NEW] [service_locator.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/core/di/service_locator.dart)
- Registers core cubits (theme, locale)
- Calls feature DI functions

---

### Localization (slang)

#### [NEW] [strings.i18n.json](file:///c:/Projects/encryption_caeser_vigenere/lib/i18n/strings.i18n.json)
- All English translations with keys prefixed by feature: `home.title`, `caesar.inputHint`, `vigenere.keyLabel`, etc.

#### [NEW] [strings_ar.i18n.json](file:///c:/Projects/encryption_caeser_vigenere/lib/i18n/strings_ar.i18n.json)
- All Arabic translations matching English keys

---

### Feature — Home

#### [NEW] [home_screen.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/features/home/presentation/screens/home_screen.dart)
- Algorithm selection screen with two animated cards (Caesar / Vigenère)
- AppBar with title, theme toggle, language toggle

#### [NEW] [cipher_selection_card.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/features/home/presentation/widgets/cipher_selection_card.dart)
- Glassmorphic card with icon, title, description, neon glow on hover/tap

#### [NEW] [animated_title.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/features/home/presentation/widgets/animated_title.dart)
- "Hacker" style animated typing title effect

---

### Feature — Caesar Cipher

#### [NEW] [caesar_result.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/features/caesar/domain/entities/caesar_result.dart)
- Holds: original text, encrypted/decrypted text, shift value, brute force results list

#### [NEW] Use Cases:
- **[caesar_encrypt_usecase.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/features/caesar/domain/usecases/caesar_encrypt_usecase.dart)** — Shift each letter by N (mod alphabet length). Handles both English (mod 26) and Arabic (mod 28).
- **[caesar_decrypt_usecase.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/features/caesar/domain/usecases/caesar_decrypt_usecase.dart)** — Reverse shift.
- **[caesar_brute_force_usecase.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/features/caesar/domain/usecases/caesar_brute_force_usecase.dart)** — Try all possible shifts, return list of results.

#### [NEW] [caesar_cubit.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/features/caesar/presentation/cubits/caesar/caesar_cubit.dart) / [caesar_state.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/features/caesar/presentation/cubits/caesar/caesar_state.dart)
- State: input, shift, result, isEncrypting, bruteForceResults, animationProgress
- Methods: `encrypt()`, `decrypt()`, `bruteForce()`, `updateShift()`, `clearInput()`

#### [NEW] Presentation Widgets:
- **caesar_screen.dart** — Orchestrator with AppBar, scrollable body
- **caesar_input_section.dart** — NeonTextField with language-aware validation
- **caesar_shift_slider.dart** — Custom neon slider (1 to alphabetLength-1)
- **caesar_result_display.dart** — Animated result with copy button
- **caesar_brute_force_results.dart** — Expandable list of all shifts
- **caesar_animated_letter.dart** — Single letter animation during encryption

---

### Feature — Vigenère Cipher

#### [NEW] [vigenere_result.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/features/vigenere/domain/entities/vigenere_result.dart)
- Holds: original, result, key, steps list for visualization

#### [NEW] [vigenere_step.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/features/vigenere/domain/entities/vigenere_step.dart)
- Single step: plaintext char, key char, row index, column index, result char

#### [NEW] Use Cases:
- **[vigenere_encrypt_usecase.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/features/vigenere/domain/usecases/vigenere_encrypt_usecase.dart)** — 2D Tabula Recta lookup: `table[keyCharIndex][plaintextCharIndex]`
- **[vigenere_decrypt_usecase.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/features/vigenere/domain/usecases/vigenere_decrypt_usecase.dart)** — Search row for cipher char, column index = original
- **[build_tabula_recta_usecase.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/features/vigenere/domain/usecases/build_tabula_recta_usecase.dart)** — Generates the 2D list for English (26×26) or Arabic (28×28)

#### [NEW] [vigenere_cubit.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/features/vigenere/presentation/cubits/vigenere/vigenere_cubit.dart) / [vigenere_state.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/features/vigenere/presentation/cubits/vigenere/vigenere_state.dart)
- State: input, key, result, steps, tabulaRecta, highlightedRow, highlightedCol, currentStepIndex
- Methods: `encrypt()`, `decrypt()`, `buildTable()`, `animateStep()`, `clearInput()`

#### [NEW] Presentation Widgets:
- **vigenere_screen.dart** — Orchestrator
- **vigenere_input_section.dart** — Plaintext input with validation
- **vigenere_key_input.dart** — Key input with same language validation
- **vigenere_result_display.dart** — Animated result display
- **tabula_recta_table.dart** — Interactive 2D matrix with highlighted row/column
- **tabula_recta_cell.dart** — Individual cell with highlight animation
- **vigenere_step_visualizer.dart** — Step-by-step walkthrough UI

---

### Main Entry Point

#### [MODIFY] [main.dart](file:///c:/Projects/encryption_caeser_vigenere/lib/main.dart)
- Initialize DI (`setupServiceLocator()`)
- Wrap with `TranslationProvider` (slang)
- Provide `ThemeCubit` and `LocaleCubit` at app level
- Configure `MaterialApp.router` with GoRouter, theme, locale, supported locales, RTL directionality

---

## Encryption Logic Details

### Caesar Cipher
```
Encrypt: result[i] = alphabet[(indexOf(plaintext[i]) + shift) % alphabetLength]
Decrypt: result[i] = alphabet[(indexOf(ciphertext[i]) - shift + alphabetLength) % alphabetLength]
BruteForce: for shift in 1..alphabetLength-1 → decrypt(ciphertext, shift)
```

### Vigenère Cipher (2D Tabula Recta)
```
Build Table: table[row][col] = alphabet[(row + col) % alphabetLength]

Encrypt: 
  row = indexOf(keyChar)
  col = indexOf(plaintextChar)
  result = table[row][col]

Decrypt:
  row = indexOf(keyChar)
  Search table[row] for cipherChar → foundCol
  result = alphabet[foundCol]
```

### Arabic Alphabet (28 letters):
```
ا ب ت ث ج ح خ د ذ ر ز س ش ص ض ط ظ ع غ ف ق ك ل م ن ه و ي
```

---

## Input Validation Rules

| Mode    | Allowed Characters       | Regex               | Rejected                  |
|---------|--------------------------|----------------------|---------------------------|
| English | A-Z, a-z                | `[A-Za-z]`          | Arabic, digits, symbols   |
| Arabic  | \u0600-\u06FF            | `[\u0600-\u06FF]`   | English, digits, symbols  |

- On language switch → **clear all input fields** (safer than conversion)
- Key field follows same validation as plaintext field
- Spaces are **preserved** (passed through without encryption)

---

## Packages Required

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  flutter_bloc: ^9.1.0
  go_router: ^15.1.0
  get_it: ^8.0.3
  google_fonts: ^6.2.1
  slang: ^4.14.0
  slang_flutter: ^4.14.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0
  build_runner: ^2.4.14
  slang_build_runner: ^4.14.0
```

---

## Animations Plan

| Animation                    | Where                     | Technique                            |
|------------------------------|---------------------------|--------------------------------------|
| Letter-by-letter encryption  | Caesar/Vigenère result    | Staggered `AnimationController`      |
| Tabula Recta highlight       | Vigenère table            | Row/column glow with `AnimatedContainer` |
| Button glow pulse            | Neon buttons              | `AnimationController` + `BoxShadow`  |
| Background gradient shift    | All screens               | `AnimationController` + `Transform`  |
| Typing title effect          | Home screen               | Timer-based char reveal              |
| Card entrance                | Home/selection cards       | `SlideTransition` + `FadeTransition` |
| Language flip                | Lang toggle button         | `AnimatedSwitcher` with flip         |

---

## Open Questions

> [!IMPORTANT]
> **Arabic Alphabet Order:** I'm using the standard 28-letter Modern Standard Arabic alphabet. Should I include hamza (ء) as a separate letter (making it 29)? The plan currently uses 28.

> [!IMPORTANT]
> **Space Handling:** Spaces in input are currently planned to pass through unchanged (not encrypted). Is this the desired behavior, or should spaces be stripped?

---

## Verification Plan

### Automated Tests
- `flutter analyze` — must be clean
- `flutter test` — all unit tests for use cases pass
- Manual UI testing via `flutter run`

### Manual Verification
1. **English Caesar:** Encrypt "HELLO" with shift 3 → "KHOOR"
2. **Arabic Caesar:** Encrypt Arabic text with shift 3 → correct shifted Arabic
3. **English Vigenère:** Encrypt "HELLO" with key "KEY" → verify against known output
4. **Arabic Vigenère:** Encrypt Arabic text with Arabic key → verify
5. **Brute Force:** Decrypt without knowing shift → shows all possibilities
6. **Language Toggle:** Switch language → inputs clear, UI flips RTL/LTR
7. **Input Validation:** Type Arabic in English mode → rejected; type English in Arabic mode → rejected
8. **Theme Toggle:** Dark ↔ Light switch works correctly
9. **Animations:** Letter-by-letter, table highlighting, button glows all animate smoothly
