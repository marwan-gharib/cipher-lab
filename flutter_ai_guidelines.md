# Flutter AI Engineering Guidelines

> Read before any task. All rules are mandatory.
> **AI Agents: start with Section 18.0 and Section 24.0 before writing any code.**

---

## 1. Purpose & Scope

Defines all engineering rules, architecture patterns, and conventions for Flutter projects. Applies to humans and AI assistants equally. No rule is optional.

**Core goal:** Clean · Scalable · Maintainable · Production-ready · Zero technical debt shortcuts.

---

## 2. Clean Architecture

### 2.1 Folder Structure

```
lib/
├── core/
│   ├── constants/
│   │   ├── app_constants.dart
│   │   ├── endpoints.dart
│   │   ├── build_config.dart          (populated via --dart-define — never commit real values)
│   │   ├── links.dart
│   │   └── assets.dart
│   ├── cubits/                        (shared cubits used by 2+ features)
│   │   └── connectivity/
│   │       ├── connectivity_cubit.dart
│   │       └── connectivity_state.dart
│   ├── di/
│   │   └── service_locator.dart
│   ├── domain/                        (shared domain objects used by 2+ features)
│   │   ├── entities/
│   │   ├── enums/
│   │   └── params/
│   ├── error/
│   │   ├── exceptions.dart
│   │   ├── failures.dart
│   │   ├── handling/
│   │   │   ├── dio_error_handler.dart
│   │   │   └── error_handler.dart
│   │   └── mappers/
│   │       └── error_mapper.dart
│   ├── local/
│   │   ├── database/
│   │   │   ├── app_database.dart      (abstract)
│   │   │   └── sqflite_database.dart
│   │   └── secure/
│   │       ├── secure_storage_client.dart (abstract)
│   │       └── secure_storage_impl.dart
│   ├── network/
│   │   ├── api_client.dart            (abstract)
│   │   ├── dio_client.dart
│   │   └── interceptors/
│   │       ├── auth_interceptor.dart
│   │       ├── error_interceptor.dart
│   │       └── logging_interceptor.dart
│   ├── routing/
│   │   ├── app_router.dart
│   │   └── routes.dart
│   ├── services/
│   │   └── crash_reporting/
│   │       ├── crash_reporting_service.dart (abstract)
│   │       └── crash_reporting_impl.dart
│   ├── theme/
│   │   ├── app_colors.dart
│   │   ├── app_text_styles.dart
│   │   ├── app_spacing.dart
│   │   ├── app_radius.dart
│   │   ├── app_theme.dart
│   │   ├── cubit/
│   │   │   ├── theme_cubit.dart
│   │   │   └── theme_state.dart
│   │   ├── modes/
│   │   │   ├── light.dart
│   │   │   └── dark.dart
│   │   └── theme_extensions/
│   ├── utils/
│   └── widgets/
│
├── features/
│   └── feature_name/
│       ├── di/
│       │   └── feature_di.dart
│       ├── data/
│       │   ├── datasources/
│       │   │   ├── remote/
│       │   │   │   ├── feature_remote_datasource.dart      (abstract — if needed)
│       │   │   │   └── feature_remote_datasource_impl.dart
│       │   │   └── local/
│       │   │       ├── feature_local_datasource.dart       (abstract — if needed)
│       │   │       └── feature_local_datasource_impl.dart
│       │   ├── models/
│       │   │   ├── feature_model.dart
│       │   │   ├── feature_cache_model.dart                (if needed)
│       │   │   └── sub_models/
│       │   └── repositories/
│       │       └── feature_repository_impl.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   └── feature_entity.dart
│       │   ├── repositories/
│       │   │   └── feature_repository.dart                 (abstract)
│       │   └── usecases/
│       │       └── get_feature_usecase.dart
│       └── presentation/
│           ├── cubits/
│           │   ├── feature_list/
│           │   │   ├── feature_list_cubit.dart
│           │   │   └── feature_list_state.dart
│           │   ├── feature_detail/
│           │   │   ├── feature_detail_cubit.dart
│           │   │   └── feature_detail_state.dart
│           │   └── feature_form/
│           │       ├── feature_form_cubit.dart
│           │       └── feature_form_state.dart
│           ├── screens/
│           │   └── feature_screen.dart
│           └── widgets/
│               └── feature_widget.dart
│
└── main.dart
```

### 2.2 Key Folder Rules

**core/cubits:** Only for cubits used by 2+ features or app-wide concerns (connectivity, session, push). Single-feature cubits stay inside that feature. Each cubit has its own subfolder with cubit + state files.

**core/domain:** Only for entities/enums/params referenced by 2+ features. Do not move to core until a second feature actually needs it.

**local storage:** `app_database.dart` / `secure_storage_client.dart` are abstract interfaces — the app depends on these, not on sqflite or flutter_secure_storage directly.

**feature DI:** Each feature registers its own deps in `di/feature_di.dart`. `service_locator.dart` only registers core deps and calls each feature's DI function.

**cubits folder:** Each Cubit + State live in their own subfolder. Never mix multiple Cubits in the same folder.

**models vs entities:**
- `feature_model.dart` — DTO (data layer only). Has `fromJson`, `toJson`, `fromEntity`/`toEntity`. Never used outside data layer.
- `feature_cache_model.dart` — DTO for sqflite. Only create when local caching is required.
- `feature_entity.dart` — pure Dart, no JSON, no Flutter imports.

### 2.3 Layer Rules

**Data Layer** — models, datasources, repository implementations.
- Models map to/from entities. Datasources do raw API/DB calls only. Repos coordinate datasources. No models outside data layer.

**Domain Layer** — entities, abstract repos, use cases.
- Pure Dart. No Flutter, no JSON. Each use case has one `call()` method. Zero dependencies on other layers.

**Presentation Layer** — Cubits, screens, widgets.
- UI → Cubits only. Cubits call use cases. No business logic in UI. Stateless widgets where possible.

### 2.4 Dependency Rules

| Allowed | Not Allowed | Reason |
|---|---|---|
| Presentation → Domain | Presentation → Data | UI must not touch DTOs |
| Data → Domain | Domain → Data | Domain stays pure |
| Features → Core | Core → Features | Core is feature-agnostic |
| Feature A (via core) | Feature A → Feature B | Features are independent |

### 2.5 Cross-Feature Dependency Rules

**Golden Rule:**
```
Feature A  ──────→  core/  ←──────  Feature B
```
Features communicate **only through `core/`** — never by importing each other.

**❌ Strictly Forbidden:**
```dart
// Importing another feature's internal classes
import 'package:my_app/features/auth/domain/entities/user_entity.dart'; // inside features/profile/

// Calling another feature's use case
import 'package:my_app/features/cart/domain/usecases/get_cart_usecase.dart'; // inside features/checkout/

// Injecting Feature A's Cubit into Feature B's screen
BlocProvider<AuthCubit>(child: ProfileScreen())
```

**✅ Correct Patterns:**

**Pattern 1 — Shared entity/enum → `core/domain/`**
```dart
import 'package:my_app/core/domain/entities/user_entity.dart'; // both features import from core
```

**Pattern 2 — Shared use case → `core/domain/usecases/`**
Only when 2+ distinct features need it. Register in `core/di/service_locator.dart`.

**Pattern 3 — Shared state → `core/cubits/`**
Features read/write a shared core Cubit instead of knowing about each other.

**Pattern 4 — Cross-feature navigation via GoRouter**
```dart
// ❌ FORBIDDEN
import 'package:my_app/features/checkout/presentation/screens/checkout_screen.dart';
Navigator.push(context, MaterialPageRoute(builder: (_) => CheckoutScreen()));

// ✅ Correct
context.go(Routes.checkout);
```

**Shared Code Decision Table:**

| Shared thing | Used by | Move to |
|---|---|---|
| Entity / model | 2+ features | `core/domain/entities/` |
| Enum | 2+ features | `core/domain/enums/` |
| Param class | 2+ features | `core/domain/params/` |
| Use case | 2+ features | `core/domain/usecases/` |
| Cubit / shared state | 2+ features | `core/cubits/` |
| Widget | 2+ features | `core/widgets/` |
| Utility / extension | 2+ features | `core/utils/` |
| Repository interface | single feature | stays in feature's `domain/repositories/` |
| Screen / widget | single feature | stays in its own feature |

**When you find a cross-feature violation:** Flag it, do NOT fix it mid-task. Create a tracked issue and fix it in a dedicated refactor task.

---

## 3. SOLID Principles

**S — Single Responsibility:** One reason to change per class. If the class name has "And", split it.

**O — Open/Closed:** Add new use cases instead of bloating existing ones. Use abstract classes over if/else chains.

**L — Liskov Substitution:** Implementations must fully satisfy the abstract interface contract. Never change a method's semantics in an override.

**I — Interface Segregation:** Small, focused interfaces. No class implements methods it doesn't use.

**D — Dependency Inversion:** Depend on abstractions. Inject via constructor or get_it. Cubits receive use case abstractions, not implementations.

---

## 4. State Management (Cubit / BLoC)

### 4.1 Cubit vs BLoC

| Use Cubit | Upgrade to BLoC |
|---|---|
| Simple linear state flow | Multiple concurrent event streams |
| No complex event transformation | Event debouncing/throttling |
| Straightforward state transitions | Complex state machines or event queues |

### 4.2 Split Cubits by Responsibility

A feature must never have one Cubit for everything. Split by responsibility:
- `FeatureListCubit` — fetching and displaying a list
- `FeatureDetailCubit` — single item details and actions
- `FeatureFormCubit` — form inputs, validation, submission

Each Cubit + State live in their own subfolder inside `presentation/cubits/`.

### 4.3 State Design

**Approach A — Sealed class states (preferred with `freezed`):** Best for async ops with distinct phases (loading/success/failure). Use when UI renders completely different layouts per state.

**Approach B — Single state class with `copyWith`:** Best for forms/filters with many independent fields updating over time. Use `freezed` for `copyWith` and equality.

Choose the approach that fits. Don't force sealed states where `copyWith` is cleaner, and vice versa.

### 4.4 Cubit Rules

- Cubits call use cases only — not repositories, not datasources
- Never perform navigation, show dialogs, or use `BuildContext` inside a Cubit
- Use `BlocListener` for side effects (navigation, snackbars, dialogs)
- Use `BlocBuilder` only for UI rebuilds — always add `buildWhen`
- Use `BlocConsumer` only when both listener and builder are needed in the same widget

### 4.5 Alternatives to Cubit

**`ValueNotifier` / `ValueListenableBuilder`:** Single value changing over time, purely local to one widget. Cubit would be overkill.

**`flutter_riverpod`:** State needed anywhere in the tree without explicit `BlocProvider` nesting; complex dependency graphs; automatic async caching. If Riverpod is used in a feature, apply it consistently — don't mix with Cubit within the same feature.

**`ChangeNotifier`:** Complex local state with multiple fields where Cubit is too heavy and `ValueNotifier` is too simple.

**Universal rules regardless of approach:**
- Business logic never in the UI layer
- State is immutable — emit/notify to change, never mutate fields directly
- One approach per feature, applied consistently
- Document non-default approach in a comment at the top of the relevant file

---

## 5. Routing (go_router)

- All routing via `go_router` — no `Navigator.push` anywhere
- `app_router.dart` — `GoRouter` instance and all route definitions
- `routes.dart` — all route name/path constants — never hardcode route strings inline
- Use `ShellRoute` for nested navigation (e.g. bottom nav bar)
- Pass only primitives through routes — fetch full data inside destination screen via its Cubit
- Auth guards in `GoRouter`'s `redirect` callback, not in widgets
- Cubits injected at route definition level via `BlocProvider` — not inside the screen widget

---

## 6. Dependency Injection (get_it)

- `service_locator.dart` registers core/network/local deps and calls each feature's DI setup
- Each feature registers its own deps in `features/feature_name/di/feature_di.dart`
- `lazySingleton` for services, repositories, datasources, use cases
- `factory` for Cubits — fresh instance on every navigation, no stale state
- Never call `sl<>()` inside widget `build()` methods or constructors
- Inject Cubits at the route definition level in `app_router.dart` — the router is the only place `sl<>()` is called for Cubits

---

## 7. Networking (Dio)

- All Dio configuration in `core/network/dio_client.dart`
- Never import Dio directly from a Cubit, use case, or widget
- Three interceptors: `AuthInterceptor` (tokens + 401 refresh), `ErrorInterceptor` (DioException → Failure), `LoggingInterceptor` (debug only)
- All endpoints are constants in `core/constants/endpoints.dart`
- API responses mapped to models in the data layer — never parse JSON in a Cubit
- Always set `connectTimeout`, `receiveTimeout`, and `sendTimeout`

---

## 8. Package Rules

- Use `freezed` + `json_serializable` for classes with many fields or needing `copyWith`/equality
- Always run `build_runner` after changes and commit generated files

| Required | Forbidden |
|---|---|
| Latest stable version, explicit version in pubspec.yaml | Outdated, empty, or `any` version |
| Actively maintained, Flutter Favorite or high pub.dev score | Abandoned (>1yr no updates + open critical issues) |
| Null-safe, Dart 3 compatible, documented | Forked/unpublished packages in production |

Always use caret format: `package: ^x.y.z`

### 8.1 Package Deprecation Protocol

**Stop using immediately when:**
- Marked discontinued on pub.dev
- No updates for 12+ months with open breaking issues
- Incompatible with current stable Flutter SDK
- Flutter/Dart team recommends migration

**What must happen:**
1. Stop all new usage immediately
2. Identify official/community replacement (verify pub.dev score, null-safety, Dart 3 compat)
3. Migrate in a dedicated branch with clear commit trail
4. Update `pubspec.yaml`, regenerate files, run full app to verify
5. Update this document

**Known replacement paths:**

| Package | Replacement if deprecated |
|---|---|
| `dio` | `http` + custom interceptor layer, or `chopper` |
| `get_it` | `injectable`, or Flutter's `InheritedWidget` DI |
| `flutter_bloc` | `riverpod` or `signals` |
| `go_router` | Monitor `flutter/packages` — currently the Flutter team's recommendation |
| `sqflite` | `drift` (type-safe, actively maintained) |
| `flutter_secure_storage` | Platform keychain/keystore via `local_auth` or successor |
| `freezed` | Manual `copyWith` + Dart 3 native `sealed` classes |
| `fpdart` | `result_dart` or native Dart patterns |

*Last review: March 2026.*

---

## 9. File, Class & Code Rules

### 9.1 One Class Per File

Every file contains exactly one class. The only exception: a `StatefulWidget` file contains the widget class and its private `State` class — inseparable by Flutter's design. No other multi-class combinations allowed. Enums/typedefs supporting the single class may coexist; if shared, move to their own file.

### 9.2 File Structure

- File name = primary class name in snake_case (`UserProfileCubit` → `user_profile_cubit.dart`)
- Files beyond ~150 lines must be split
- Break logic into small, reusable private methods
- No catch-all utility files — group by domain

### 9.3 Naming Conventions

| Type | Convention | Example |
|---|---|---|
| Classes / Enums | PascalCase | `UserRepository`, `AuthState` |
| Variables / Functions | camelCase | `fetchUser()`, `isLoading` |
| Constants | camelCase or k-prefix | `kBaseUrl`, `maxRetries` |
| Files | snake_case | `user_repository_impl.dart` |
| Folders | snake_case | `features/auth/domain/` |
| Private members | `_` prefix | `_controller`, `_fetchData()` |

### 9.5 Class Instantiation Intent

**Utility/constants class (never instantiated) → private constructor:**
```dart
class AppSpacing {
  AppSpacing._(); // prevents instantiation
  static const double sm = 8.0;
}
// Same rule for: AppColors, AppRadius, AppTextStyles, AppConstants, BuildConfig, Endpoints, Assets, Routesو ..etc
```

```dart
// ❌ Wrong — abstract means "contract for subclasses", not "no instances"
abstract class AppSpacing { static const double md = 16.0; }
```

**True abstract class / interface (implemented or extended) → `abstract`:**
```dart
abstract class CrashReportingService {
  Future<void> initialize();
  Future<void> recordError(Object error, StackTrace stack, {bool fatal = false});
}
```

**Decision table:**

| Class type | Declaration |
|---|---|
| Only `static` members (constants, utils) | `class Foo { Foo._(); }` |
| Defines a contract (repository, service, client) | `abstract class Foo {}` |
| Normal class with logic, gets instantiated | `class Foo {}` |
| Extended with shared implementation | `abstract class Foo {}` |

### 9.6 Import Ordering

```dart
// 1. Dart SDK
import 'dart:async';

// 2. Flutter framework
import 'package:flutter/material.dart';

// 3. External packages
import 'package:flutter_bloc/flutter_bloc.dart';

// 4. Local project files
import 'package:my_app/core/theme/app_colors.dart';
```

Blank line between each group.

---

## 10. StatelessWidget vs StatefulWidget

Default to `StatelessWidget`. Only use `StatefulWidget` when genuinely required.

### 10.1 Use StatelessWidget When

- No local state — renders from constructor params only
- All state managed externally by Cubit, `ValueNotifier`, or parent
- No controllers, animation tickers, focus nodes, or lifecycle callbacks needed
- Widget can be `const` → must be `StatelessWidget`

### 10.2 Use StatefulWidget When

- **Controllers** — `TextEditingController`, `ScrollController`, `AnimationController`, `PageController` that must be initialized and disposed locally
- **Animation** — `SingleTickerProviderStateMixin` / `TickerProviderStateMixin` needed
- **Focus management** — `FocusNode` created and disposed locally
- **`initState` / `didChangeDependencies` / `didUpdateWidget`** — initialization on mount or reaction to dependency changes
- **Local ephemeral UI state** — genuinely local, never shared, doesn't belong in a Cubit (e.g. password visibility toggle)

Do NOT use `StatefulWidget` to avoid creating a Cubit. Shared/persisted/testable state belongs in a Cubit.

### 10.3 Widget Lifecycle Management

**`initState`:** Initialize controllers, animations, focus nodes. `super.initState()` first. No direct async calls — use `WidgetsBinding.instance.addPostFrameCallback` or trigger via Cubit.

**`dispose`:** Dispose every controller/animation/focus node created in `initState`. `super.dispose()` last. Never access `context` after dispose.

**`didUpdateWidget`:** React when widget configuration changes and a resource needs updating.

**`didChangeDependencies`:** React when an `InheritedWidget` dependency changes.

**Always dispose:**
`TextEditingController` · `ScrollController` · `AnimationController` · `PageController` · `TabController` · `FocusNode` · `StreamSubscription`

Treat all lint warnings as errors and fix before merging.

---

## 11. Code Quality & Best Practices

### 11.1 General Rules

- Naming must eliminate the need for comments. Comment only WHY, never WHAT.
- No magic numbers — use named constants
- Prefer explicit over clever — readable beats clever
- Delete dead code — never comment it out

### 11.2 DRY

- Logic appearing twice → extract to shared utility, extension, or base class
- Shared widgets → `core/widgets/`. Shared utilities → `core/utils/`. Never copy-paste between features.

### 11.3 Abstraction Rules

**Always required:**
- Repository interfaces in domain layer
- `ApiClient` in `core/network/`
- `AppDatabase` and `SecureStorageClient` in `core/local/`

**Optional (only if there's a real reason):**
- Datasource interfaces inside features — only if testability or a second implementation is planned
- Service classes in `core/services/` — only if multiple implementations exist or are planned

**Never:**
- Don't create an abstract class for a class with only one implementation that isn't mocked
- Don't create base classes just to share a few lines — use composition or extensions
- Don't abstract for the appearance of "clean architecture" — every abstract layer must serve a concrete purpose
- Don't default to creating abstract interfaces for new `core/` files unless the abstraction has genuine value

### 11.4 Error Handling

- Use `Either<Failure, Success>` from `fpdart`
- All Failure types in `core/error/failures.dart` (`NetworkFailure`, `ServerFailure`, `CacheFailure`, etc.)
- Never let `DioException` bubble past the data layer — convert in `ErrorInterceptor` or repository
- `try/catch` only at the datasource level — propagate via `Either` above that
- **User-facing error messages must be human-readable and meaningful:**
  - ❌ `"SocketException: Connection refused"` → ✅ `"No internet connection. Please check your network and try again."`
  - ❌ `"500 Internal Server Error"` → ✅ `"Something went wrong on our side. Please try again later."`

### 11.5 Debugging Strategy

- Fix root causes — never suppress with empty catch blocks
- No TODO comments in production — fix now or create a tracked issue
- No temporary hacks without documentation and a cleanup task

---

## 12. Widget & Screen Decomposition

### 12.1 Core Principle

**Decomposition is about clarity, not line count.** Split proactively whenever a piece of UI has a clear identity. Ask: *"Does extracting this widget make the code easier to understand?"* If yes, extract — regardless of size.

### 12.2 Screen Responsibility

A screen is an orchestrator — it assembles widgets and connects to the Cubit. Its `build()` reads like an outline. Logic (formatting, conditions, calculations) never lives in `build()`.

```dart
// ❌ Everything inline
class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
      Row(children: [Image.network(product.imageUrl, width: 80, height: 80), ...]),
      Text(product.description),
      ElevatedButton(onPressed: () => context.read<ProductCubit>().addToCart(), ...),
    ]));
  }
}

// ✅ Decomposed — scannable, navigable
class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
      ProductHeader(product: product),
      const SizedBox(height: AppSpacing.lg),
      ProductDescription(product: product),
      const SizedBox(height: AppSpacing.lg),
      ProductAddToCartButton(),
    ]));
  }
}
```

### 12.3 When to Extract into a Separate Class

Extract when **any** of these are true:
- Has a distinct visual identity or responsibility
- Extracting makes the parent `build()` easier to scan
- Reused in more than one place
- Benefits from `const` construction (enables `const`, prevents rebuilds)
- Needs its own lifecycle (animations, controllers, focus nodes)
- A developer returning to this code would benefit from navigating directly to it by name

Never use line count as the only reason to keep a widget inline.

### 12.4 When to Use a Private Method Instead

Use `Widget _buildSomething()` only when **all** of these are true:
- Tightly coupled to parent's local state, can't be passed as constructor params cleanly
- Never reused outside the current file
- Minor visual detail with no distinct identity (e.g. a single decorative divider)

Keep it under ~15 lines. If it grows or gains logic, convert to a separate class.

### 12.5 Splitting Logic into Methods

Every class decomposes logic into small, named methods:
- Each method does one thing, named to describe exactly what it does
- No method exceeds ~20–25 lines — extract sub-steps if needed
- No deeply nested logic (max 2 levels) — extract inner blocks to named methods
- Computed values needing more than one expression → named getter or method, not inline in `build()`

### 12.6 Method & Attribute Visibility

**Private (`_`) when:** Implementation detail, helper used only in the same file, exposing it violates encapsulation (internal controllers, internal state variables).

**Public when:** Intentional API for callers, required by interface/abstract contract, Cubit method called by UI.

**Rules:**
- Default to private — promote to public only when there's a clear reason
- Widget constructor parameters → always public
- Internal controllers → always private
- Cubit-facing methods → always public; internal Cubit helpers → always private

---

## 13. Flutter Performance

> Profile with Flutter DevTools before optimizing — never guess.

### 13.1 Reducing Unnecessary UI Rebuilds

#### 13.1.1 Use `const` constructors everywhere possible

```dart
// ❌ rebuilt on every parent rebuild
Padding(padding: EdgeInsets.all(AppSpacing.md), child: Text('Hello'))

// ✅ created once, never rebuilt
const Padding(padding: EdgeInsets.all(AppSpacing.md), child: Text('Hello'))
```

Every widget that can be `const` must be `const`. Extract widget classes to enable `const` on reused subtrees.

#### 13.1.2 Always use `buildWhen` on `BlocBuilder`

```dart
// ❌ rebuilds on every state emission
BlocBuilder<CheckoutCubit, CheckoutState>(
  builder: (context, state) => PriceDisplay(total: state.total),
)

// ✅ rebuilds only when total changes
BlocBuilder<CheckoutCubit, CheckoutState>(
  buildWhen: (prev, next) => prev.total != next.total,
  builder: (context, state) => PriceDisplay(total: state.total),
)
```

Every `BlocBuilder` must have `buildWhen` unless it genuinely needs to rebuild on every state change (rare). Compare specific fields — never return `true` unconditionally. Split a screen with multiple independent sections into multiple `BlocBuilder`s each with their own `buildWhen`.

#### 13.1.3 Split Cubits to minimize rebuild scope

One Cubit owning all screen state forces every `BlocBuilder` to evaluate on every change. Split by responsibility (Section 4.2) so changes in one area never trigger evaluation in another.

#### 13.1.4 Extract widgets into separate classes to narrow rebuild scope

Inline sub-widgets in `build()` always rebuild with the parent. Extracted widget classes have their own rebuild scope.

#### 13.1.5 Use `select` for precise state access

```dart
// ❌ full widget rebuilds whenever any CartState field changes
BlocBuilder<CartCubit, CartState>(
  builder: (context, state) => CartBadge(count: state.itemCount),
)

// ✅ only rebuilds when itemCount changes
final count = context.select<CartCubit, int>((cubit) => cubit.state.itemCount);
return CartBadge(count: count);
```

#### 13.1.6 `setState` rules

- Use `setState` only in small, fully self-contained widgets where the entire widget must rebuild
- More than 2–3 fields or partial rebuild needed → prefer `ValueNotifier`/`ValueListenableBuilder` or a Cubit
- Never use `setState` for data shared between widgets or screens

### 13.2 Reducing Unnecessary UI Repaints

Use Flutter DevTools **Highlight Repaints** overlay to visualize repaint regions before applying any fix.

#### 13.2.1 Use `RepaintBoundary` to isolate expensive regions

```dart
RepaintBoundary(child: AnimatedParticleWidget()) // isolated compositing layer
RepaintBoundary(child: ListView.builder(...))     // scrollable isolated from fixed header
```

Use for: continuous animations, scrollable lists in non-scrollable layouts, complex `CustomPainter` widgets, anything DevTools shows repainting unexpectedly. Don't overuse — each boundary has a memory cost.

#### 13.2.2 Avoid expensive operations in `CustomPainter.paint()`

```dart
// ❌ path computed every frame (60×/sec)
void paint(Canvas canvas, Size size) {
  final path = _computeExpensivePath(size);
  canvas.drawPath(path, paint);
}

// ✅ cached
Path? _cachedPath;
Size? _lastSize;
void paint(Canvas canvas, Size size) {
  if (_cachedPath == null || _lastSize != size) {
    _cachedPath = _computeExpensivePath(size);
    _lastSize = size;
  }
  canvas.drawPath(_cachedPath!, paint);
}

@override
bool shouldRepaint(GoodPainter old) => false; // only true when inputs change
```

Cache all computed paths, gradients, and layout calculations that don't change between frames.

#### 13.2.3 Avoid opacity and clipping on animated widgets

| Expensive | Prefer instead |
|---|---|
| `Opacity` on animated widget | `FadeTransition` |
| `Transform(...)` recreated each frame | `AnimatedBuilder` + `Transform` widget |
| `ClipRRect` inside an animation | Cache the clip or rethink design |
| `ShaderMask` on every frame | Pre-render to `ui.Image` if static |

#### 13.2.4 Image performance

```dart
// Always — specify dimensions, use memCacheWidth/Height at 2× display size
CachedNetworkImage(
  imageUrl: product.imageUrl,
  width: 80, height: 80,
  memCacheWidth: 160, memCacheHeight: 160, // 2× for high-DPI
  fit: BoxFit.cover,
)
```

- Always use `cached_network_image` — never `Image.network` in production
- Always specify `width` and `height`
- Local assets: use `.webp` and compress before adding

### 13.3 List Performance

```dart
// ✅ mandatory for any list with more than ~5 items
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) => ItemTile(item: items[index]),
)

// ✅ add itemExtent when all items are the same height — O(1) scroll math
ListView.builder(
  itemExtent: 72.0,
  itemCount: items.length,
  itemBuilder: (context, index) => ItemTile(item: items[index]),
)
```

- Never `ListView(children: [...])` for more than ~5 static items
- Add `itemExtent` or `prototypeItem` when all items share the same height
- Wrap complex/independently animated list items in `RepaintBoundary`
- Use `const` constructors inside `itemBuilder` wherever possible

### 13.4 Performance Profiling Workflow

1. **Run in profile mode** (`flutter run --profile`) — never profile in debug mode
2. **Open Flutter DevTools → Performance tab**
3. **Identify problem layer:** High UI thread time → rebuilds (Section 13.1). High raster thread time → repaints (Section 13.2)
4. **Enable overlays:** `debugRepaintRainbowEnabled = true` · `debugPrintRebuildDirtyWidgets = true`
5. **Apply minimum fix → re-profile to confirm → move on**

---

## 14. Deprecated Code — Zero Tolerance

- Never use deprecated Flutter/Dart APIs, widgets, constructor parameters, or packages
- Deprecation warnings = errors — fix before merging, never suppress
- When upgrading Flutter/Dart SDK: audit for new deprecations and resolve in a dedicated chore commit before continuing feature work

---

## 15. Theming

- All theme code in `core/theme/` exclusively
- `app_colors.dart` — all color constants as `static const`
- `app_text_styles.dart` — all `TextStyle` constants
- `app_theme.dart` — builds `ThemeData` from colors and text styles
- `light.dart` / `dark.dart` — light and dark `ThemeData` instances
- `theme_cubit.dart` — manages runtime theme switching
- Never define colors, font sizes, or spacing inline in widget code
- Never use hardcoded hex strings in widgets — always reference `app_colors.dart`

### 15.1 Spacing & Dimension Constants

Never use magic numbers like `SizedBox(height: 16)` or `EdgeInsets.all(12)` inline.

```dart
class AppSpacing {
  AppSpacing._();
  static const double xs;
  static const double sm;
  static const double md;
  static const double lg;
  static const double xl;
  static const double xxl;
}

class AppRadius {
  AppRadius._();
  static const double sm;
  static const double md;
  static const double lg;
  static const double xl;
}
```

Always reference `AppSpacing` and `AppRadius`. New values → add to the file, never inline. Same rule applies to icon sizes, button heights, avatar sizes.

---

## 16. Security

- Never store secrets/tokens/sensitive data in `SharedPreferences` or plain local files
- Use `flutter_secure_storage` via `SecureStorageClient` abstraction for all sensitive data at rest
- Never log tokens, passwords, or PII — `LoggingInterceptor` must redact auth headers
- Never hardcode API keys, base URLs, or credentials — use `BuildConfig` populated via `--dart-define`; file is a template only, never contains real values in source control
- Validate all user input in the domain layer before sending to APIs
- `CrashReportingService` must scrub PII and tokens before sending any error payload

---

## 17. Git Workflow

- One branch per feature or fix — never work on `main` or `develop`
- Branch naming: `feature/name`, `fix/name`, `chore/name`
- Conventional Commits format for all commit messages
- Atomic commits — one logical change per commit
- Open a PR when feature is complete and tested. PR title = what changed; description = why
- No self-merge — code review required
- Rebase onto target branch before opening PR

**Commit examples:**
```
feat(auth): add biometric login support
fix(network): handle 504 timeout in error interceptor
refactor(home): extract product card into separate widget
chore(deps): update dio and flutter_bloc
test(auth): add unit tests for login use case
```

---

## 18. GitHub Workflow — Full Branch Lifecycle

> ⚠️ **Every git command affecting remote or local history (push, merge, rebase, delete) requires explicit user approval before execution. No exceptions.**

### 18.0 The Full Flow

```
① Pull  →  ② Create Branch  →  ③ Make Changes  →  ④ Commit  →  ⑤ Push  →  ⑥ Merge Locally  →  ⑦ Delete Branch
```

Steps ④ through ⑦ each require a **separate, explicit approval** — never chained or automated.

### 18.1 ① Pull — Before Anything

```bash
git checkout main       # or 'develop' if used
git pull origin main    # NEVER skip
```

If `git pull` fails for any reason → **stop and report to user immediately** — do not attempt to resolve git state silently.

### 18.2 ② Create Branch

```bash
git checkout -b feature/short-description

# Examples:
# git checkout -b feature/biometric-login
# git checkout -b fix/cart-duplicate-items
# git checkout -b chore/upgrade-flutter-3-24
# git checkout -b refactor/auth-cubit-split
```

**After steps ① and ②, AI must confirm:**
```
✅ Pulled latest from origin/main
✅ Created branch: feature/your-branch-name
▶️ Starting task...
```

Only then begin code changes.

### 18.3 ③ Make Changes

- Work only on the current branch — never switch mid-task
- Run `flutter analyze` continuously — treat every warning as an error
- Don't move to commit until `flutter analyze` is clean and `flutter test` passes

### 18.4 ④ Commit — Show Summary → Get Approval → Then Commit

**AI must NEVER stage or commit without explicit user approval.**

Present before committing:
```
📋 Changes ready to commit:

  CREATED:
  - lib/features/auth/domain/usecases/biometric_login_usecase.dart

  MODIFIED:
  - lib/features/auth/presentation/cubits/login/login_cubit.dart — added biometricLogin()
  - lib/features/auth/di/auth_di.dart — registered BiometricLoginUseCase

📝 Proposed commit message:
  feat(auth): add biometric login use case and cubit integration

✅ flutter analyze — clean
✅ flutter test — all passing

Do you approve staging and committing these changes?
```

Only after approval:
```bash
git add lib/features/auth/domain/usecases/biometric_login_usecase.dart
git add lib/features/auth/presentation/cubits/login/login_cubit.dart
git add lib/features/auth/di/auth_di.dart
git commit -m "feat(auth): add biometric login use case and cubit integration"
```

- **Never use `git add .` or `git add -A`** — always stage specific files explicitly
- If user requests changes after reviewing, apply and re-present before committing
- Never auto-commit at end of task

### 18.5 ⑤ Push — Show Plan → Get Approval → Then Push

**AI must NEVER push without explicit user approval.**

Present:
```
⬆️ Ready to push to remote?
This will run:
  git push -u origin feature/your-branch-name

Reply "yes" to push or "no" to stop here.
```

```bash
git push -u origin feature/your-branch-name  # first push
git push                                       # subsequent pushes
```

After rebase only: `git push --force-with-lease` — **never `git push --force`**.

Push after first commit, after every meaningful commit, and before opening a PR.

### 18.6 ⑥ Merge Locally — Show Plan → Get Approval → Then Merge

Present:
```
✅ Branch pushed to remote: origin/feature/your-branch-name

🔀 Ready to merge into main locally?
This will run:
  git checkout main
  git pull origin main
  git merge feature/your-branch-name

⚠️ Prerequisites:
  ✅ flutter analyze — clean
  ✅ flutter test — all passing

Reply "yes" to proceed or "no" to stop here.
```

```bash
git checkout main
git pull origin main
git merge feature/your-branch-name
```

**Conflict handling:** Stop immediately, report every conflicting file with full path, wait for instructions — never auto-resolve.

### 18.7 ⑦ Delete Branch Locally — Show Plan → Get Approval → Then Delete

```
🗑️ Delete the local branch feature/your-branch-name?
This will run:
  git branch -d feature/your-branch-name

Reply "yes" to delete or "no" to keep it.
```

```bash
git branch -d feature/your-branch-name  # safe delete — refuses if not merged
```

**Never use `-D` (force delete)** unless user explicitly requests it and understands the branch hasn't been merged.

Confirm after deletion:
```
✅ Local branch feature/your-branch-name deleted.
🎯 You are now on main.
```

### 18.8 Keeping a Branch Up to Date (Rebase)

```bash
git fetch origin
git rebase origin/main       # or origin/develop
git push --force-with-lease  # after rebase only
```

**Never merge the base branch into your feature branch** — always rebase for linear history.

### 18.9 Hotfix Workflow

Branch from `main`, not `develop`:
```bash
git checkout main && git pull origin main
git checkout -b fix/critical-bug-name
```

After hotfix PR merges to `main`: open a second PR to merge it into `develop`. Delete the hotfix branch after both merges are confirmed.

### 18.10 Branch Naming Reference

| Type | Pattern | Example |
|---|---|---|
| Feature | `feature/short-description` | `feature/biometric-login` |
| Bug fix | `fix/short-description` | `fix/cart-duplicate-items` |
| Hotfix | `fix/short-description` | `fix/payment-crash-prod` |
| Chore / maintenance | `chore/short-description` | `chore/upgrade-flutter-3-22` |
| Refactor | `refactor/short-description` | `refactor/auth-cubit-split` |
| Test | `test/short-description` | `test/login-usecase-coverage` |

Lowercase kebab-case only. No uppercase, no underscores.

---

## 19. Testing Strategy

Testing is mandatory. Untested generated code is not production-ready.

### 19.1 Test Folder Structure

Mirror `lib/` under `test/`:
```
test/
├── core/
│   ├── error/
│   └── network/
└── features/
    └── feature_name/
        ├── data/
        │   ├── datasources/
        │   └── repositories/
        ├── domain/
        │   └── usecases/
        └── presentation/
            └── cubits/
                └── feature_list/
```

### 19.2 Coverage Requirements

| Layer | What to test | Minimum coverage |
|---|---|---|
| Domain — use cases | All execution paths including failures | 100% |
| Data — repositories | Coordination between remote and local | 100% |
| Data — datasources | Interface contract only, mock HTTP client | 80%+ |
| Presentation — Cubits | Every state transition, every emitted sequence | 100% |
| Core widgets | Rendering, interaction, edge-case states | 80%+ |

### 19.3 Mocking Rules

- Use `mocktail` — preferred over `mockito` (no code-gen required, better null-safety)
- Mock at the **repository boundary** in Cubit tests
- Mock at the **datasource boundary** in repository tests
- Never mock classes you own that are small enough to use directly — use real in-memory implementations

```dart
class MockProductRepository extends Mock implements ProductRepository {}

setUp(() {
  mockRepository = MockProductRepository();
  cubit = ProductListCubit(getProductsUseCase: GetProductsUseCase(mockRepository));
});
```

### 19.4 Cubit Testing

Use `bloc_test` for all Cubit tests. Never call methods and read `cubit.state` directly.

```dart
blocTest<ProductListCubit, ProductListState>(
  'emits [loading, success] when products are fetched successfully',
  build: () {
    when(() => mockRepository.getProducts()).thenAnswer((_) async => Right(fakeProducts));
    return ProductListCubit(getProductsUseCase: GetProductsUseCase(mockRepository));
  },
  act: (cubit) => cubit.loadProducts(),
  expect: () => [
    const ProductListState.loading(),
    ProductListState.success(products: fakeProducts),
  ],
);
```

### 19.5 Widget Testing

- Use `flutter_test` — no additional package required
- Wrap under test in `MaterialApp` + `BlocProvider` with mock Cubit
- Test all meaningful states: loading, success, empty, error
- Use `find.byType`, `find.byKey`, `find.text` — prefer semantic over index-based finders
- Use `tester.tap` + `tester.pump` for interactions
- Assign `Key` constants to widgets that need to be targeted in tests

```dart
testWidgets('shows loading indicator when state is loading', (tester) async {
  whenListen(mockCubit, Stream.fromIterable([const ProductListState.loading()]),
      initialState: const ProductListState.loading());

  await tester.pumpWidget(MaterialApp(
    home: BlocProvider<ProductListCubit>.value(
      value: mockCubit,
      child: const ProductListScreen(),
    ),
  ));

  expect(find.byType(CircularProgressIndicator), findsOneWidget);
});
```

### 19.6 Integration Tests

- Place in `integration_test/`
- Cover critical happy-path flows only: login → home, add to cart → checkout, etc.
- Include `IntegrationTestWidgetsFlutterBinding.ensureInitialized()` in every integration test file
- Run against real or network-mocked backend — never against production

### 19.7 Running Tests

```bash
flutter test                    # all unit and widget tests
flutter test --coverage         # with coverage
flutter test test/features/...  # single file
flutter test integration_test/  # integration tests
```

A PR must not be merged if `flutter test` fails or `flutter analyze` has issues.

---

## 20. Localization & Internationalization (i18n)

No string literals may appear directly in widget code.

### 20.1 Setup

Use `flutter_localizations` + `intl` + ARB files. `AppLocalizations` is the single access point.

```yaml
# pubspec.yaml
dependencies:
  flutter_localizations:
    sdk: flutter
  intl: ^0.19.0
flutter:
  generate: true
```

```yaml
# l10n.yaml
arb-dir: lib/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
```

### 20.2 ARB File Location

```
lib/l10n/
├── app_en.arb    (template — always the source of truth)
├── app_ar.arb
└── app_fr.arb
```

Key naming: camelCase, prefixed by feature. Every key must have a `@key` metadata block.

```json
{
  "authLoginTitle": "Sign in to your account",
  "@authLoginTitle": { "description": "Title at top of login screen" },
  "cartItemCount": "{count, plural, =0{No items} =1{1 item} other{{count} items}}",
  "@cartItemCount": {
    "description": "Cart item count label",
    "placeholders": { "count": { "type": "int" } }
  }
}
```

### 20.3 Usage

```dart
// Recommended — add extension to core/utils/extensions/context_extensions.dart
extension LocalizationExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

Text(context.l10n.authLoginTitle)
```

### 20.4 Rules

- Never hardcode user-facing strings in a widget — always use `context.l10n.keyName`
- Never put strings in a Cubit or use case — they belong in the presentation layer
- Never use string interpolation to assemble sentences — use ARB placeholder syntax
- Every new ARB key must have a `@key` metadata description
- Non-English ARB files must be kept in sync — missing keys are a build error
- Wrap `MaterialApp` with `Directionality` driven by active locale for RTL languages (Arabic, Hebrew, etc.)

---

## 21. Flavors & Environment Configuration

### 21.1 Environments

| Environment | Purpose |
|---|---|
| `dev` | Local dev — sandbox API, debug logging on |
| `staging` | Pre-production — mirrors prod, used for QA/UAT |
| `prod` | Production — real users, logging off, crash reporting on |

### 21.2 `build_config.dart`

```dart
// core/constants/build_config.dart — NO real values here. Template only.
abstract class BuildConfig {
  static const String environment = String.fromEnvironment('ENVIRONMENT', defaultValue: 'dev');
  static const String apiBaseUrl = String.fromEnvironment('API_BASE_URL', defaultValue: 'https://dev-api.example.com');
  static const String sentryDsn = String.fromEnvironment('SENTRY_DSN', defaultValue: '');

  static bool get isDev     => environment == 'dev';
  static bool get isStaging => environment == 'staging';
  static bool get isProd    => environment == 'prod';
}
```

```bash
# Dev
flutter run --dart-define=ENVIRONMENT=dev --dart-define=API_BASE_URL=https://dev-api.example.com

# Staging
flutter build apk --dart-define=ENVIRONMENT=staging --dart-define=API_BASE_URL=https://staging-api.example.com

# Production
flutter build apk --dart-define=ENVIRONMENT=prod --dart-define=API_BASE_URL=https://api.example.com --dart-define=SENTRY_DSN=https://...
```

### 21.3 Rules

- `build_config.dart` is a template — never contains real values in source control
- CI/CD injects real values via secrets management at build time
- Never read `BuildConfig` inside a Cubit, use case, or repository — pass via DI or use only in `core/network/` and `core/constants/`
- Never use `kDebugMode`/`kReleaseMode` for environment behavior — always use `BuildConfig.isDev`/`BuildConfig.isProd`

---

## 22. Crash Reporting & Monitoring

### 22.1 Abstraction

```dart
// core/services/crash_reporting/crash_reporting_service.dart
abstract class CrashReportingService {
  Future<void> initialize();
  Future<void> recordError(Object error, StackTrace stackTrace, {bool fatal = false});
  Future<void> setUserId(String userId);
  Future<void> clearUserId();
  Future<void> log(String message);
}
```

Concrete implementation uses Firebase Crashlytics or Sentry. Register as `lazySingleton` in `service_locator.dart`.

### 22.2 Integration Points

**Global Flutter error handler in `main.dart`:**
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl<CrashReportingService>().initialize();

  FlutterError.onError = (details) => sl<CrashReportingService>()
      .recordError(details.exception, details.stack ?? StackTrace.empty, fatal: false);

  PlatformDispatcher.instance.onError = (error, stack) {
    sl<CrashReportingService>().recordError(error, stack, fatal: true);
    return true;
  };

  runApp(const MyApp());
}
```

**In repository for unexpected server errors:**
```dart
sl<CrashReportingService>().recordError(e, s);
return Left(ServerFailure(message: 'Unexpected error occurred.'));
```

### 22.3 Rules

- Disabled entirely in `dev`, enabled in `staging` and `prod` — use `BuildConfig.isDev`
- Never include PII, tokens, or passwords in crash reports — scrub in implementation before forwarding
- Never log sensitive user data via `log()` — only technical context (screen name, operation type, error code)
- `setUserId()` after login, `clearUserId()` on logout
- Fatal errors always reported regardless of environment — only non-fatal logging is gated in dev

---

## 23. Accessibility (a11y)

Every widget a user interacts with or reads must be accessible to screen readers and large-text users.

### 23.1 Semantics

Flutter built-ins handle semantics automatically. Custom interactive widgets must have explicit semantics:

```dart
Semantics(
  label: 'Add to cart',
  button: true,
  onTap: () => cubit.addToCart(product),
  child: CustomCartButton(product: product),
)
```

- Decorative images → `excludeFromSemantics: true`
- Content images → meaningful `semanticLabel`
- Icons used as buttons → `Semantics` wrapper or `IconButton` with `tooltip`
- Custom list items → `Semantics` wrapper describing the full item

### 23.2 Text Scaling

Never use fixed-pixel heights on containers that hold text.

```dart
// ❌ clips at font scale > 1.0
SizedBox(height: 48, child: Text(context.l10n.buttonLabel))

// ✅ grows with text
Padding(
  padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
  child: Text(context.l10n.buttonLabel),
)
```

- Never force-cap text size with `MediaQuery.textScalerOf` — respect user's accessibility settings
- Test all screens at 1.5× and 2.0× font scale
- Use `TextOverflow.ellipsis` only as last resort — prefer layouts that expand

### 23.3 Color Contrast

- All text must meet WCAG AA: 4.5:1 for normal text, 3:1 for large text (18sp+ or 14sp+ bold)
- Never rely on color alone to convey meaning — pair with icon, label, or shape
- Test in both light and dark mode

### 23.4 Touch Targets

Interactive elements must meet 48×48dp minimum:

```dart
GestureDetector(
  behavior: HitTestBehavior.opaque,
  onTap: onTap,
  child: ConstrainedBox(
    constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
    child: smallIcon,
  ),
)
```

---

## 24. AI Assistant Behavior Rules

### 24.1 ⚠️ Pre-Task Protocol — MANDATORY BEFORE ANY CODE IS WRITTEN

**1. Read the codebase structure**
- Use the provided file tree or ask for it if not provided
- Read every file directly affected by the task and any files they depend on
- Never assume a file's content — read it

**2. State your understanding**
- Summarize the task in your own words
- List every file to create, modify, or delete — with the reason for each
- State all assumptions explicitly: class names, method signatures, import paths, DI registrations

**3. Present a plan and get approval**
```
📋 Task Plan:

FILES TO CREATE:
  - lib/features/auth/domain/usecases/biometric_login_usecase.dart
  - lib/features/auth/presentation/cubits/login/biometric_login_state.dart

FILES TO MODIFY:
  - lib/features/auth/presentation/cubits/login/login_cubit.dart — add biometricLogin() method
  - lib/features/auth/di/auth_di.dart — register BiometricLoginUseCase

ASSUMPTIONS:
  - BiometricAuthService already exists in core/services/
  - LoginCubit already has sealed states via freezed

Shall I proceed?
```

Only proceed after confirmation. If user modifies the plan, update and confirm again before starting.

**4. Execute one logical unit at a time**
Complete domain layer → confirm → data layer → confirm → presentation. Don't dump all files at once.

**5. Follow the Git protocol**
After task approval: pull (18.1) → create branch (18.2) → confirm to user → begin changes (18.3).

### 24.2 Existing Project Compatibility

If the project doesn't follow this document's architecture, continue within the existing pattern. **Do not refactor mid-task.** Mixing two architectural patterns causes conflicts and bugs. These guidelines apply to new projects or new features added from scratch.

### 24.3 Code Changes

- Never rewrite an entire file for a small change — modify only affected lines
- Always read the existing file before generating code — never write from assumptions
- Generated code must match existing naming, formatting, and architecture conventions exactly
- Don't add packages unless explicitly requested — check `pubspec.yaml` first and notify the user
- Never remove existing code or comments unless explicitly asked
- Never leave partial implementations — every method, class, and use case must be complete and functional
- If the task can't be completed with current context, state what's missing and ask

### 24.4 Output Standards

- Clean, production-ready code from the first attempt
- No unnecessary explanatory comments in generated code
- No TODO or FIXME — complete the implementation
- Follow all naming and structure rules in this document
- Every generated class must comply with SOLID and Clean Architecture
- Never generate deprecated APIs, widgets, parameters, or patterns
- Apply widget decomposition (Section 12) — never generate a monolithic screen or widget
- Apply `StatelessWidget` vs `StatefulWidget` rules (Section 10) — never default to `StatefulWidget`
- Every `StatefulWidget` must include `dispose()` for all controllers created in `initState`
- Never hardcode user-facing strings — use `context.l10n.keyName` and add the key to the ARB template
- Never hardcode spacing, colors, or radius — always reference `AppSpacing`, `AppColors`, `AppRadius`

### 24.5 Partial Context Handling

- State all assumptions explicitly before generating code — class names, file paths, import paths
- If a dependency is assumed (repository, use case, model), state its assumed signature before using it
- If context is insufficient for correct code, **ask for missing files** — don't invent implementations
- After generating, list any files that must be created or modified beyond the primary output
- **Never assume DI registrations exist** — state explicitly where and how to register new classes
- **Never assume ARB keys exist** — include the ARB entry that must be added alongside widget code

### 24.6 Collaboration

- Act as a senior team member, not just a code generator
- If a requirement is ambiguous, ask one clear question — not a list of ten
- If the requested approach violates these guidelines, flag it and suggest the correct approach — never silently comply
- If an improvement to existing code is spotted, mention it
- If rules conflict, choose the simplest, most maintainable solution
- **After completing a task**, provide a concise summary of:
  - What was done
  - What files were created or changed
  - Follow-up tasks (tests to write, DI registrations, ARB keys)
  - Open questions or decisions the user still needs to make

---

## 25. AI Task Completion Checklist

Verify every item before declaring a task complete. Report unchecked items to the user.

**Architecture:**
- [ ] Every new class follows Clean Architecture layer rules (Section 2.3)
- [ ] No layer dependency violations (Section 2.4)
- [ ] Dependency injection registered for every new class (Section 6)

**Code quality:**
- [ ] No hardcoded strings — all user-facing text has ARB entries (Section 20)
- [ ] No hardcoded colors, spacing, or radius values (Section 15)
- [ ] No deprecated APIs or widgets (Section 14)
- [ ] No `TODO` or `FIXME` in generated code (Section 24.3)
- [ ] No partial implementations — every method is fully implemented

**State management:**
- [ ] Cubit registered as `factory` in DI (Section 6)
- [ ] States are sealed or use `copyWith` as appropriate (Section 4.3)
- [ ] No business logic in the UI layer (Section 4.4)

**Widgets:**
- [ ] `StatelessWidget` used where no local state is needed (Section 10)
- [ ] Widget decomposition applied — no monolithic `build()` methods (Section 12)
- [ ] `dispose()` implemented for every controller created in `initState` (Section 10.3)

**Performance:**
- [ ] `const` constructors applied everywhere possible (Section 13.1.1)
- [ ] Every `BlocBuilder` has `buildWhen` (Section 13.1.2)
- [ ] No expensive computation inside `CustomPainter.paint()` (Section 13.2.2)
- [ ] `ListView.builder` used for lists with more than ~5 items (Section 13.3)
- [ ] All network images use `cached_network_image` with `width`, `height`, `memCacheWidth/Height` (Section 13.2.4)

**Cross-feature:**
- [ ] No direct imports between features — all shared code in `core/` (Section 2.5)
- [ ] Shared entities/enums/params in `core/domain/` if used by 2+ features (Section 2.5)
- [ ] Navigation between features uses route names only — no screen imports (Section 2.5, Pattern 4)

**Git:**
- [ ] Pulled from origin before starting (Section 18.1)
- [ ] Working on a dedicated branch — not on `main` or `develop` (Section 18.2)
- [ ] `flutter analyze` clean before committing (Section 18.3)
- [ ] `flutter test` passing before committing (Section 18.3)
- [ ] Awaiting user approval before staging or committing (Section 18.4)
- [ ] Awaiting user approval before pushing to remote (Section 18.5)
- [ ] Awaiting user approval before merging into main locally (Section 18.6)
- [ ] Awaiting user approval before deleting the local branch (Section 18.7)
- [ ] No cross-feature imports — shared logic moved to core (Section 2.5)

---

> **Read this document before starting any task. Follow all rules strictly.**
>
> **Goal:** ***Clean | Scalable | Maintainable | Production-Ready | Tested | Accessible | Performant***
>
> **AI Agents: always follow Section 18.0 (Git Lifecycle) and Section 24.0 (Pre-Task Protocol) before touching any file.**
> **AI Agents: always follow Section 2.5 (Cross-Feature Rules) — never import from another feature directly.**
