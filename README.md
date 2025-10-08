
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




















## Complete Feature Example: Hall of Fame

The Hall of Fame feature demonstrates the full architecture implementation with Riverpod state management:

### Domain Layer (`lib/src/features/halloffame/domain/`)

**Entities** (`entities/hall_of_fame_entry.dart`):
```dart
class HallOfFameEntry {
  final String id;
  final String memberId;
  final String memberName;
  final String achievement;
  final String description;
  final DateTime achievedAt;
  final String category;
  final String? imageUrl;
  // ... constructor, copyWith, toString
}
```

**Repository Interface** (`repositories/hall_of_fame_repository.dart`):
```dart
abstract class HallOfFameRepository {
  Future<List<HallOfFameEntry>> getAllEntries();
  Future<List<HallOfFameEntry>> getEntriesByCategory(String category);
  Future<List<HallOfFameEntry>> getEntriesByMember(String memberId);
  Future<HallOfFameEntry?> getEntryById(String id);
}
```

### Data Layer (`lib/src/features/halloffame/data/`)

**DTO Model** (`models/hall_of_fame_entry_dto.dart`):
```dart
class HallOfFameEntryDto {
  // JSON serialization fields
  factory HallOfFameEntryDto.fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
  HallOfFameEntry toEntity(); // Converts DTO to domain entity
  factory HallOfFameEntryDto.fromEntity(HallOfFameEntry entity);
}
```

**Data Source** (`sources/hall_of_fame_data_source.dart`):
```dart
abstract class HallOfFameDataSource {
  Future<List<HallOfFameEntryDto>> getAllEntries();
  // ... other methods
}

class MockHallOfFameDataSource implements HallOfFameDataSource {
  // Mock implementation with sample data
}
```

**Repository Implementation** (`repositories/hall_of_fame_repository_impl.dart`):
```dart
class HallOfFameRepositoryImpl implements HallOfFameRepository {
  final HallOfFameDataSource _dataSource;
  
  @override
  Future<List<HallOfFameEntry>> getAllEntries() async {
    final dtos = await _dataSource.getAllEntries();
    return dtos.map((dto) => dto.toEntity()).toList();
  }
  // ... other implementations
}
```

### Presentation Layer (`lib/src/features/halloffame/presentation/`)

**State Management** (`notifiers/hall_of_fame_state.dart`):
```dart
class HallOfFameState {
  final List<HallOfFameEntry> entries;
  final bool isLoading;
  final String? error;
  final String selectedCategory;
  // ... copyWith, computed properties
}
```

**Riverpod Notifier** (`notifiers/hall_of_fame_notifier.dart`):
```dart
class HallOfFameNotifier extends StateNotifier<HallOfFameState> {
  final HallOfFameRepository _repository;
  
  Future<void> loadEntries() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final entries = await _repository.getAllEntries();
      state = state.copyWith(entries: entries, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: 'Failed to load entries: $e', isLoading: false);
    }
  }
}
```

**Riverpod Providers** (`notifiers/providers/hall_of_fame_providers.dart`):
```dart
final hallOfFameDataSourceProvider = Provider<HallOfFameDataSource>((ref) {
  return MockHallOfFameDataSource();
});

final hallOfFameRepositoryProvider = Provider<HallOfFameRepository>((ref) {
  final dataSource = ref.watch(hallOfFameDataSourceProvider);
  return HallOfFameRepositoryImpl(dataSource);
});

final hallOfFameNotifierProvider = StateNotifierProvider<HallOfFameNotifier, HallOfFameState>((ref) {
  final repository = ref.watch(hallOfFameRepositoryProvider);
  return HallOfFameNotifier(repository);
});
```

**UI Components** (`widgets/achievement_card.dart`):
```dart
class AchievementCard extends StatelessWidget {
  final HallOfFameEntry entry;
  final VoidCallback? onTap;
  // ... beautiful card UI with category colors, star icons
}
```

**Screen** (`screens/hall_of_fame_screen.dart`):
```dart
class HallOfFameScreen extends ConsumerStatefulWidget {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(hallOfFameNotifierProvider);
    final notifier = ref.read(hallOfFameNotifierProvider.notifier);
    // ... UI implementation with category filters, pull-to-refresh
  }
}
```

### App Integration (`lib/src/app.dart`)

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope( // Riverpod's dependency injection
      child: MaterialApp(
        home: const MainNavigationScreen(),
      ),
    );
  }
}
```

### Data Flow Validation

1. **UI Request**: User opens Hall of Fame screen
2. **State Management**: `HallOfFameNotifier.loadEntries()` is called
3. **Repository Call**: Notifier calls `HallOfFameRepository.getAllEntries()`
4. **Data Source**: Repository calls `HallOfFameDataSource.getAllEntries()`
5. **Data Mapping**: DTOs are converted to domain entities via `toEntity()`
6. **State Update**: Notifier updates state with new entries
7. **UI Update**: Screen rebuilds with new data via Riverpod's reactive system

This implementation demonstrates:
- ✅ Clean separation of concerns across layers
- ✅ Dependency inversion (domain depends on abstractions)
- ✅ Testable architecture (mockable data sources)
- ✅ Modern state management with Riverpod
- ✅ Reactive UI updates
- ✅ Proper error handling and loading states

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

- This project uses **Riverpod** for dependency injection and state management.
- Providers are defined in `presentation/notifiers/providers/` for each feature.
- The main app wraps everything in `ProviderScope` for dependency injection.
- For simple cases, use `Provider<T>` for immutable dependencies.
- For state management, use `StateNotifierProvider<Notifier, State>`.
- Alternative: For smaller projects, consider `get_it` + `injectable` or simple constructor injection.

Tests

- Place unit tests for domain/use-cases under `test/` mirroring the `lib/src` structure (e.g. `test/features/<feature>/domain/...`).

Notes & conventions

- Keep domain layer free of Flutter imports. Domain should depend only on Dart primitives and domain models.
- Data layer can depend on packages for HTTP, local storage, etc.
- Presentation layer uses Flutter widgets and Riverpod for state management.
- Use `ConsumerWidget` or `ConsumerStatefulWidget` for UI components that need to access providers.
- Use `ref.watch()` for reactive data and `ref.read()` for one-time actions.
- Keep providers close to the feature they serve (in `presentation/notifiers/providers/`).

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
