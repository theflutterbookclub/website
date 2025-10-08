import '../../domain/entities/hall_of_fame_entry.dart';

class HallOfFameState {
  final List<HallOfFameEntry> entries;
  final bool isLoading;
  final String? error;
  final String selectedCategory;

  const HallOfFameState({
    this.entries = const [],
    this.isLoading = false,
    this.error,
    this.selectedCategory = 'All',
  });

  HallOfFameState copyWith({
    List<HallOfFameEntry>? entries,
    bool? isLoading,
    String? error,
    String? selectedCategory,
  }) {
    return HallOfFameState(
      entries: entries ?? this.entries,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  List<String> get categories {
    final allCategories = entries.map((e) => e.category).toSet().toList();
    allCategories.sort();
    return ['All', ...allCategories];
  }

  List<HallOfFameEntry> get filteredEntries {
    if (selectedCategory == 'All') {
      return entries;
    }
    return entries
        .where((entry) => entry.category == selectedCategory)
        .toList();
  }
}
