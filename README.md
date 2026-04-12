<div align="center">

# 🔐 CipherX : Premium Cryptography Visualizer

**A high-fidelity, performance-optimized Flutter application showcasing classical encryption algorithms with an immersive Cyberpunk aesthetic and enterprise-grade Clean Architecture.**

[![Flutter Version](https://img.shields.io/badge/Flutter-3.5.0+-02569B?logo=flutter&logoColor=white&style=for-the-badge)](https://flutter.dev/)
[![Dart Version](https://img.shields.io/badge/Dart-3.5.0+-0175C2?logo=dart&logoColor=white&style=for-the-badge)](https://dart.dev/)
[![Architecture](https://img.shields.io/badge/Clean_Architecture-Layered-brightgreen?style=for-the-badge)](#-architecture-deep-dive)
[![State Binding](https://img.shields.io/badge/Bloc_/_Cubit-Reactive-blue?style=for-the-badge)](#-tech-stack)

</div>

---

## 📖 Overview

**CipherX** is an interactive educational sandbox designed to breathe life into classical cryptography. Unlike basic converters, CipherX visualizes the *process* of encryption. Built with **Clean Architecture** and **SOLID** principles, it serves as a production-ready blueprint for Flutter development, featuring complex animations, reactive states, and a stunning "cyber-glass" design system.

---

## ✨ Feature Matrix

| Feature | Description | Status |
| :--- | :--- | :---: |
| **🛡️ Caesar Cipher** | Real-time shifting with animated brute-force visualization. | ✅ |
| **🕹️ Premium Selector** | Custom glassy, horizontal scroll shift selector with automatic centering. | ✅ |
| **🛡️ Vigenère Sandbox** | Adaptive Tabula Recta matrix with step-by-step substitution logic. | ✅ |
| **🌍 Bilingual Engine** | Native English (LTR) and Arabic (RTL) support with dynamic regex validation. | ✅ |
| **🌓 Dynamic Themes** | Persistent Light/Dark modes with synchronized animated gradients. | ✅ |
| **🧪 Clean Architecture** | strict separation of Concern: Data, Domain, and Presentation. | ✅ |

---

## 🎨 Design Aesthetic: "The Cyber-Glass"

CipherX isn't just an app; it's an experience. The UI is built on a custom design system focused on **Visual Excellence**:

- **Neon Precision:** Curated harmonious palettes featuring *Neon Cyan*, *Deep Purple*, and *Forest Green*.
- **Glassmorphism:** Multi-layered circular glass elements with real-time `BackdropFilter` blurring.
- **Dynamic Interaction:** Micro-animations on every touchpoint—scaling selectors, glowing borders, and smooth list centering.
- **Visual Comfort:** High-contrast variants optimized for both deep-dark and eye-friendly light modes.

---

## 🛠 Tech Stack

| Category | Technology | Purpose |
| :--- | :--- | :--- |
| **Core** | [Flutter](https://flutter.dev/) | Cross-platform UI development |
| **State** | [Bloc / Cubit](https://pub.dev/packages/flutter_bloc) | Reactive, predictable state management |
| **Architecture** | [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) | Scalable and testable structure |
| **DI** | [GetIt](https://pub.dev/packages/get_it) | Modularized service location |
| **Navigation** | [GoRouter](https://pub.dev/packages/go_router) | Declarative routing and deep linking |
| **Localization** | [Slang](https://pub.dev/packages/slang) | Typed, high-performance i18n |
| **Persistence** | [Shared Preferences](https://pub.dev/packages/shared_preferences) | Theme and locale caching |

---

## 🏗 Architecture Deep Dive

The codebase follows a strict **Feature-First** Clean Architecture approach:

> [!IMPORTANT]
> **Domain Layer (Pure Dart):** Entities, Repositories (abstract), and Use Cases. Zero dependencies on Flutter or Data layers.
> **Data Layer:** Repository implementations, Data Sources (API/Local), and DTO Models.
> **Presentation Layer:** State management (Cubits), UI Screens, and Decomposed Widgets.

### 📁 Directory Layout

```text
lib/
├── core/                  # Shared infrastructure (di, routing, theme, error)
│   ├── shared/            # Common domain objects, regex, and widgets
│   └── theme/             # Design systems, extensions, and app_theme factories
├── features/              # Self-contained feature modules
│   ├── caesar/            # Domain logic, interactive widgets, and state
│   ├── vigenere/          # Matrix visualizations and step-by-step logic
│   ├── home/              # Dashboard and navigation logic
│   └── splash/            # Splash screen
└── i18n/                  # Slang-generated locale assets
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK `^3.5.0`
- `build_runner` for code generation

### Setup
1. **Clone & Enter:**
   ```bash
   git clone https://github.com/your-username/encryption_caeser_vigenere.git && cd encryption_caeser_vigenere
   ```
2. **Install & Generate:**
   ```bash
   flutter pub get
   dart run build_runner build --delete-conflicting-outputs
   ```
3. **Run:**
   ```bash
   flutter run --release # For best performance visualization
   ```

---

## 🤝 Contributing

We follow a strict **Git Lifecycle**:
1. `feature/` branch naming convention.
2. Atomic, Conventional Commits.
3. Code review required for PR merges.

---

<div align="center">
  <sub>Built with ❤️ and Precision by the CipherX Team</sub><br/>
  <i>"Cryptography is the art of solving mysteries"</i>
</div>
