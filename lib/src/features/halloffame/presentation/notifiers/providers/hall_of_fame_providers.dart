import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:website/src/features/halloffame/presentation/notifiers/hall_of_fame_state.dart';
import '../../data/repositories/hall_of_fame_repository_impl.dart';
import '../../data/sources/hall_of_fame_data_source.dart';
import '../../domain/repositories/hall_of_fame_repository.dart';
import '../notifiers/hall_of_fame_notifier.dart';

final hallOfFameDataSourceProvider = Provider<HallOfFameDataSource>((ref) {
  return MockHallOfFameDataSource();
});

// Repository provider
final hallOfFameRepositoryProvider = Provider<HallOfFameRepository>((ref) {
  final dataSource = ref.watch(hallOfFameDataSourceProvider);
  return HallOfFameRepositoryImpl(dataSource);
});

final hallOfFameNotifierProvider =
    StateNotifierProvider<HallOfFameNotifier, HallOfFameState>((ref) {
      final repository = ref.watch(hallOfFameRepositoryProvider);
      return HallOfFameNotifier(repository);
    });
