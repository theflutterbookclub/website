import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/hall_of_fame_entry.dart';
import '../../domain/repositories/hall_of_fame_repository.dart';
import 'hall_of_fame_state.dart';

class HallOfFameNotifier extends StateNotifier<HallOfFameState> {
  final HallOfFameRepository _repository;

  HallOfFameNotifier(this._repository) : super(const HallOfFameState());

  Future<void> loadEntries() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final entries = await _repository.getAllEntries();
      state = state.copyWith(entries: entries, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        error: 'Failed to load hall of fame entries: $e',
        isLoading: false,
      );
    }
  }

  Future<void> loadEntriesByCategory(String category) async {
    if (category == 'All') {
      await loadEntries();
      return;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      final entries = await _repository.getEntriesByCategory(category);
      state = state.copyWith(entries: entries, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        error: 'Failed to load entries for category $category: $e',
        isLoading: false,
      );
    }
  }

  Future<void> loadEntriesByMember(String memberId) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final entries = await _repository.getEntriesByMember(memberId);
      state = state.copyWith(entries: entries, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        error: 'Failed to load entries for member: $e',
        isLoading: false,
      );
    }
  }

  void selectCategory(String category) {
    state = state.copyWith(selectedCategory: category);
  }

  void selectEntry(HallOfFameEntry? entry) {
    state = state.copyWith(selectedEntry: entry);
  }
}
