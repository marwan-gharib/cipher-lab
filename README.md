<div align="center">

# 🔐 CipherX

**A premium Flutter application demonstrating classical encryption algorithms.**

[![Flutter Version](https://img.shields.io/badge/Flutter-3.5.0+-02569B?logo=flutter)](https://flutter.dev/)
[![Dart Version](https://img.shields.io/badge/Dart-3.5.0+-0175C2?logo=dart)](https://dart.dev/)
[![Architecture](https://img.shields.io/badge/Architecture-Clean%20Architecture-brightgreen)](#-architecture)
[![State Binding](https://img.shields.io/badge/State_Management-BLoC%20%2F%20Cubit-blue)](#-tech-stack)
[![Localization](https://img.shields.io/badge/Localization-slang-orange)](#-features)

</div>

---

## 📖 Overview

**CipherX** is a beautifully designed, modern Flutter application built to demonstrate and visualize the workings of classical encryption techniques, namely the **Caesar Cipher** and **Vigenère Cipher**. 

Designed with a premium user interface and solid architecture, this app serves dual purposes:
1. A practical tool for encrypting and decrypting messages.
2. An educational template showcasing Flutter best practices including Clean Architecture, BLoC state management, dynamic theming, and full internationalization (i18n).

---

## ✨ Features

- **🛡️ Caesar Cipher:** Interactive encryption and decryption using the classic substitution cipher.
- **🛡️ Vigenère Cipher:** Advanced polyalphabetic substitution cipher implementation.
- **🌍 Bilingual Support:** Full support for both **English (LTR)** and **Arabic (RTL)** text, powered by the `slang` package.
- **🌓 Dynamic Theming:** Seamless switching between Light and Dark modes. The state is cached locally for a persistent experience.
- **🎨 Premium UI/UX:** Built using custom Google Fonts, smooth transitions, and responsive layout designs.

---

## 🛠 Tech Stack & Architecture

CipherX is built following **Clean Architecture** principles and **Feature-First** structural guidelines, ensuring scalability, maintainability, and testing ease.

*   **UI & Framework:** [Flutter](https://flutter.dev/)
*   **State Management:** [flutter_bloc](https://pub.dev/packages/flutter_bloc) (Cubits)
*   **Routing:** [go_router](https://pub.dev/packages/go_router)
*   **Dependency Injection:** [get_it](https://pub.dev/packages/get_it)
*   **Localization (i18n):** [slang](https://pub.dev/packages/slang)
*   **Local Storage:** [shared_preferences](https://pub.dev/packages/shared_preferences) for caching theme and language states.
*   **Typography:** [google_fonts](https://pub.dev/packages/google_fonts)

---

## 📁 Project Structure

The project follows a feature-centric modular structure:

```text
lib/
├── core/                  # Core application-wide infrastructure
│   ├── constants/         # App-wide constants (colors, text paths)
│   ├── di/                # Dependency Injection (Service Locator)
│   ├── routing/           # AppRouter and Route definitions
│   ├── theme/             # Light & Dark theme configurations
│   └── shared/            # Shared domains, models, and global cubits
├── features/              # Feature modules
│   ├── splash/            # Initial splash view & loading logic
│   ├── home/              # Main dashboard for selecting algorithms
│   ├── caesar/            # Caesar cipher feature layer (Domain & Presentation)
│   └── vigenere/          # Vigenère cipher feature layer (Domain & Presentation)
├── i18n/                  # Translation JSON models & generated files
└── main.dart              # Application entry point
```

---

## 🚀 Getting Started

Follow these steps to set up the project on your local machine.

### Prerequisites

- Flutter SDK `^3.5.0` or higher
- Dart SDK `^3.5.0` or higher
- Android Studio / VS Code

### Installation

1. **Clone the repository** (if applicable):
   ```bash
   git clone https://github.com/your-username/encryption_caeser_vigenere.git
   ```

2. **Navigate to the project directory:**
   ```bash
   cd encryption_caeser_vigenere
   ```

3. **Install dependencies:**
   ```bash
   flutter pub get
   ```

4. **Generate required files** (for dependency injection or translations via `build_runner`):
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

5. **Run the App:**
   ```bash
   flutter run
   ```

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! 
Feel free to check the [issues page](#) if you want to contribute.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

<div align="center">
  <i>Built with ❤️ using Flutter.</i>
</div>
