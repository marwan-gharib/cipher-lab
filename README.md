<div align="center">

# 🔐 CipherX : Advanced Cryptography Visualizer

**A premium, high-performance Flutter application demonstrating classical encryption algorithms with stunning visual fidelity and strict clean architecture.**

[![Flutter Version](https://img.shields.io/badge/Flutter-3.5.0+-02569B?logo=flutter)](https://flutter.dev/)
[![Dart Version](https://img.shields.io/badge/Dart-3.5.0+-0175C2?logo=dart)](https://dart.dev/)
[![Architecture](https://img.shields.io/badge/Architecture-Clean%20Architecture-brightgreen)](#-architecture)
[![State Binding](https://img.shields.io/badge/State_Management-BLoC%20%2F%20Cubit-blue)](#-tech-stack)
[![Localization](https://img.shields.io/badge/Localization-slang-orange)](#-features)

</div>

---

## 📖 Overview

**CipherX** isn't just an encryption app—it is an interactive educational sandbox built to demonstrate how classical ciphers work natively under the hood. Designed strictly following **Clean Architecture** principles, the application serves as an enterprise-grade Flutter blueprint showcasing best practices in BLoC, interactive animations, and structural design.

Whether you're exploring the Caesar shift or visualizing the polyalphabetic Tabula Recta of Vigenère, CipherX guarantees an incredibly smooth, responsive experience.

---

## ✨ Features & Capabilities

- **🛡️ Caesar Cipher Sandbox:** Real-time shifting with brute-force visualization and interactive slider overlays.
- **🛡️ Vigenère Tabula Recta:** An adaptive, visually animated matrix that walks you through step-by-step polyalphabetic substitution.
- **🌍 Bilingual Support:** Full integration for **English (LTR)** and **Arabic (RTL)** text via `slang`. Features strict regex input validation bound directly to the active language!
- **🌓 Adaptive & Eye-Comfort Theming:** 
  - Dynamic **Light & Dark modes** utilizing fully cached persistent configuration.
  - Seamlessly animated, dynamic gradient backgrounds tailored to surface lighting.
  - Deep, comfortable neon accenting (Neon Cyan, Deep Purple, Forest Green) mapped through centralized `AppColors` for gorgeous glassmorphism arrays that completely alleviate eye strain.
- **⚡ Bulletproof State & Input Handling:** Functional programming error mapping, caching fault-tolerance, and dynamic SnackBar feedback strictly handled through UI layouts.

---

## 🛠 Tech Stack & Architecture

CipherX strictly adheres to **Clean Architecture** patterns separated into layered, feature-first directories.

*   **UI Framework:** [Flutter](https://flutter.dev/)
*   **State Management:** [flutter_bloc](https://pub.dev/packages/flutter_bloc) (Cubits)
*   **Routing:** [go_router](https://pub.dev/packages/go_router)
*   **Dependency Injection:** [get_it](https://pub.dev/packages/get_it)
*   **Localization (i18n):** [slang](https://pub.dev/packages/slang)
*   **Local Storage:** [shared_preferences](https://pub.dev/packages/shared_preferences) for caching theme and language states.
*   **Typography:** [google_fonts](https://pub.dev/packages/google_fonts)

---

## 📁 Project Structure

The project relies on a deeply modular layout to maximize testability and scaling capabilities:

```text
lib/
├── core/                  # Global application infrastructure
│   ├── error/             # Global failures and caching resilience
│   ├── di/                # Singleton Service Locator (GetIt)
│   ├── routing/           # Route Trees (GoRouter)
│   ├── theme/             # Centralized AppColors & ThemeData Factories
│   └── shared/            # Shared Domains, Regex Formatters, Global Cubits
├── features/              # Modularized application features
│   ├── splash/            # Entry point & boot configurations
│   ├── home/              # Main dashboard for selecting algorithms
│   ├── caesar/            # Caesar feature (Domain logics & Presentation)
│   └── vigenere/          # Vigenère feature (Tabula Recta animations)
├── i18n/                  # Slang-generated locale files
└── main.dart              # App bootstrapping
```

---

## 🚀 Getting Started

Launch CipherX locally in minutes.

### Prerequisites

- Flutter SDK `^3.5.0` or higher
- Dart SDK `^3.5.0` or higher

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/encryption_caeser_vigenere.git
   cd encryption_caeser_vigenere
   ```

2. **Acquire Packages:**
   ```bash
   flutter pub get
   ```

3. **Generate Dependencies:**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Launch Application:**
   ```bash
   flutter run
   ```

---

## 🤝 Contributing

We welcome structural improvements, new algorithm integrations, and optimizations!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/StunningVisualizer`)
3. Commit your Changes (`git commit -m 'feat: Add stunning visualizer'`)
4. Push to the Branch (`git push origin feature/StunningVisualizer`)
5. Open a Pull Request

---

<div align="center">
  <i>Engineered with clean code and built with ❤️ using Flutter.</i>
</div>
