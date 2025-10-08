import '../../domain/entities/hall_of_fame_entry.dart';
import '../../domain/repositories/hall_of_fame_repository.dart';
import '../models/hall_of_fame_entry_dto.dart';
import '../sources/hall_of_fame_data_source.dart';

class HallOfFameRepositoryImpl implements HallOfFameRepository {
  final HallOfFameDataSource _dataSource;

  const HallOfFameRepositoryImpl(this._dataSource);

  @override
  Future<List<HallOfFameEntry>> getAllEntries() async {
    final dtos = await _dataSource.getAllEntries();
    return dtos.map((dto) => dto.toEntity()).toList();
  }

  @override
  Future<List<HallOfFameEntry>> getEntriesByCategory(String category) async {
    final dtos = await _dataSource.getEntriesByCategory(category);
    return dtos.map((dto) => dto.toEntity()).toList();
  }

  @override
  Future<List<HallOfFameEntry>> getEntriesByMember(String memberId) async {
    final dtos = await _dataSource.getEntriesByMember(memberId);
    return dtos.map((dto) => dto.toEntity()).toList();
  }

  @override
  Future<HallOfFameEntry?> getEntryById(String id) async {
    final dto = await _dataSource.getEntryById(id);
    return dto?.toEntity();
  }
}
