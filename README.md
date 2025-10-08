
# Project structure and flow

This repository follows a feature-first, layered architecture. The main idea:

- Split code by feature under `lib/src/features/<feature>/`.
- Each feature contains (at least) three layers: `domain`, `data`, and `presentation`.
- Shared utilities, widgets, and core helpers live under `lib/src/shared` or `lib/src/core`.

Folder responsibilities

- `lib/src/features/<feature>/domain/`
	- Entities, repository interfaces and use-cases (business logic contracts).
	- Example: `lib/src/features/sessions/domain/domain.dart` contains `HomepageEntity` and `HomepageRepository` interface.

- `lib/src/features/<feature>/data/`
	- Concrete implementations: data sources (API, local), models, and repository implementations that fulfill the domain contracts.
	- Example: `lib/src/features/sessions/data/sources/` (data sources file exists and can hold API/local implementations).

- `lib/src/features/<feature>/presentation/`
	- UI code: screens, pages, widgets, view models, controllers, and routing for the feature.
	- Example: `lib/src/features/homepage/presentation/screens/` and `widgets/` for UI components.

- `lib/src/shared/` and `lib/src/core/`
	- Reusable widgets, theming, common helpers, and app-wide utilities. Use these for code shared across features.

Flow (how data moves)

1. Presentation requests an action (e.g., load page). The screen calls a use-case or repository API from `domain`.
2. The domain layer defines the contract (repository interface) and use-case classes.
3. The data layer implements repository interfaces and provides access to data sources (network, local storage).
4. Data is returned as entities or models, mapped by the data layer into domain entities.
5. Presentation receives entities/results, updates UI.

Example: homepage flow

- Contract: `lib/src/features/homepage/domain/repositories/repositories.dart` exposes `HomepageRepository` (interface).
- Implementation: create `lib/src/features/homepage/data/repositories/homepage_repository_impl.dart` that implements `HomepageRepository` and uses `data/sources/*` for network/local access.
- Presentation: `lib/src/features/homepage/presentation/screens/homepage_screen.dart` uses a view model (or controller) which depends on `HomepageRepository` to fetch `HomepageEntity` and render it.

Adding a new feature (step-by-step)

1. Create the feature folder

	 lib/src/features/<your_feature>/
	 ├─ data/
	 │  ├─ sources/
	 │  └─ models/
	 ├─ domain/
	 │  ├─ entities/
	 │  └─ repositories/
	 └─ presentation/
			├─ screens/
			└─ widgets/
			└─ notifiers/
			

2. Define domain contracts

	 - Add business logic under `domain/`.

3. Implement data access

	 - Add data-source classes (API/local) under `data/sources/`.
	 - Implement repository classes in `data/repositories/` that map raw responses to domain entities.

4. Build the UI

	 - Create screens and widgets under `presentation/`, and inject the repository (or use-case) into your view model/controller.

Dependency injection

- This project doesn't enforce a specific DI framework in the template. Use simple constructor injection for small projects. For larger apps, consider `get_it` + `injectable` or Riverpod providers.

Tests

- Place unit tests for domain/use-cases under `test/` mirroring the `lib/src` structure (e.g. `test/features/<feature>/domain/...`).

Notes & conventions

- Keep domain layer free of Flutter imports. Domain should depend only on Dart primitives and domain models.
- Data layer can depend on packages for HTTP, local storage, etc.
- Presentation can and should use Flutter widgets and state management of choice (Provider, Riverpod, Bloc, etc.).

## Shared model example — Member

If you have a model used across features (for example, a club member), add a domain-only entity under `lib/src/shared/models/` and keep serialization DTOs in `lib/src/shared/data/models/` or the feature `data/` folder if they are feature-specific.

- Domain entity (no JSON): `lib/src/shared/models/member.dart`
	- Contains the `Member` class used throughout the app and business logic.
- DTO (serialization): `lib/src/shared/data/models/member_dto.dart` or `lib/src/features/<feature>/data/models/member_dto.dart`
	- Contains `fromJson`/`toJson` and a `toEntity()` mapper to convert to `Member`.

## Shared widgets and theme

This project keeps reusable widgets and app theming under `lib/src/shared/`.

- Shared widgets: `lib/src/shared/widgets/`
	- `app_button.dart` — a small reusable button component.
	- `card_member.dart` — a small Member card widget showing basic member info.
	- `widgets.dart` — barrel export for shared widgets.

- Theme & text styles: `lib/src/shared/theme/`
	- `app_theme.dart` — central ThemeData factory (e.g. `AppTheme.light()`).
	- `text_styles.dart` — centralized text style helpers used by `app_theme`.

Usage example:

```dart
import 'package:website/src/shared/theme/app_theme.dart';
import 'package:website/src/shared/widgets/widgets.dart';

// In your MaterialApp
// theme: AppTheme.light(),

// Use shared widget in a screen:
// AppButton(label: 'Join', onPressed: () {}),
```
