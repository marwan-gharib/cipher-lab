<div align="center">
  <img src="assets/app_logo.png" alt="CipherX Logo" width="150" style="border-radius: 20px; box-shadow: 0 4px 8px rgba(0,0,0,0.2);"/>

  <h1>🔐 CipherX</h1>
  <h3>Premium Cryptography Visualizer</h3>

  <p><b>A high-fidelity, performance-optimized Flutter application showcasing classical encryption algorithms through an immersive Cyberpunk aesthetic.</b></p>

  <p>
    <a href="https://flutter.dev/"><img src="https://img.shields.io/badge/Flutter-3.5.0+-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" /></a>
    <a href="https://dart.dev/"><img src="https://img.shields.io/badge/Dart-3.5.0+-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart" /></a>
    <a href="#-architecture--tech-stack"><img src="https://img.shields.io/badge/Clean_Architecture-Strict-2EA043?style=for-the-badge&logo=clean-code&logoColor=white" alt="Architecture" /></a>
    <a href="#-architecture--tech-stack"><img src="https://img.shields.io/badge/State-Bloc_/_Cubit-00B4AB?style=for-the-badge&logo=firebase&logoColor=white" alt="State Binding" /></a>
    <a href="#"><img src="https://img.shields.io/badge/License-MIT-red?style=for-the-badge" alt="License" /></a>
  </p>
</div>

<br/>

> **CipherX** is an interactive educational sandbox designed to breathe life into classical cryptography. Unlike basic converters, CipherX visualizes the *process* of encryption with an animated step-by-step breakdown. Built to production-ready standards, it features complex animations, reactive states, and a stunning "cyber-glass" design system.

---

## 📱 Screenshots

<p align="center">
  <img src="assets/screenshots/WhatsApp%20Image%202026-05-20%20at%204.29.29%20PM.jpeg" width="170"  style="margin:8px;"/>
  <img src="assets/screenshots/WhatsApp%20Image%202026-05-20%20at%204.29.39%20PM.jpeg" width="170"  style="margin:8px;"/>
  <img src="assets/screenshots/WhatsApp%20Image%202026-05-20%20at%204.29.57%20PM.jpeg" width="170"  style="margin:8px;"/>
  <img src="assets/screenshots/WhatsApp%20Image%202026-05-20%20at%204.30.07%20PM.jpeg" width="170"  style="margin:8px;"/>
</p>

<div align="center">
  <img src="assets/screenshots/WhatsApp%20Image%202026-05-20%20at%204.30.22%20PM.jpeg" width="170"  style="margin:8px;"/>
  <img src="assets/screenshots/WhatsApp%20Image%202026-05-20%20at%204.30.35%20PM.jpeg" width="170"  style="margin:8px;"/>
  <img src="assets/screenshots/WhatsApp%20Image%202026-05-20%20at%204.30.44%20PM.jpeg" width="170"  style="margin:8px;"/>
  <img src="assets/screenshots/WhatsApp%20Image%202026-05-20%20at%204.31.00%20PM.jpeg" width="170"  style="margin:8px;"/>
</div>

---

## ✨ Core Features & UX

| Feature | Description |
| :--- | :--- |
| **🛡️ Crypto Visualization** | Real-time shifting with animated brute-force visualization and adaptive Tabula Recta matrices. |
| **🎨 Visual Excellence** | Curated harmonious palettes featuring *Neon Cyan*, *Deep Purple*, and *Forest Green*. |
| **🕹️ Dynamic Interaction** | Micro-animations on every touchpoint—scaling selectors, glowing borders, and smooth list centering. |
| **🪞 Glassmorphism** | Multi-layered circular glass elements with real-time blur and frosted UI components. |
| **🌍 Bilingual Engine** | Native English (LTR) and Arabic (RTL) support with dynamic regex validation and localization via **Slang**. |
| **🌓 Dynamic Themes** | Persistent Light/Dark modes with synchronized animated gradients. |

---

## 🏗 Architecture & Tech Stack

CipherX is engineered using a robust **Feature-First Clean Architecture**, ensuring deep separation of concerns and limitless scalability. 

<div align="center">

| Component | Technology Used | Purpose |
| :--- | :--- | :--- |
| **Framework** | **[Flutter 3.5.0+](https://flutter.dev/)** | High-performance, cross-platform rendering |
| **State Mgt.** | **[Bloc / Cubit](https://pub.dev/packages/flutter_bloc)** | Predictable, reactive state emission |
| **Architecture** | **Clean Architecture** | Strict boundaries (Domain ↔ Data ↔ Presentation) |
| **Dependency** | **[GetIt](https://pub.dev/packages/get_it)** | Decoupled service location and dependency injection |
| **Navigation** | **[GoRouter](https://pub.dev/packages/go_router)** | Declarative routing & robust deep-linking capabilities |
| **Localization** | **[Slang](https://pub.dev/packages/slang)** | Type-safe, high-performance i18n implementation |

</div>

---

## 🚀 Quick Start Guide

**1. Clone the repository:**
```bash
git clone https://github.com/your-username/encryption_caeser_vigenere.git
cd encryption_caeser_vigenere
```

**2. Install dependencies and run code generators:**
```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

**3. Launch the visualizer:**
```bash
flutter run --release
```
> *Note: It is highly recommended to run in `--release` mode to experience the complex animations and glassmorphism smoothly at 60/120fps.*

---

<div align="center">
  <h3><i>"Cryptography is the art of solving mysteries"</i></h3>
</div>
