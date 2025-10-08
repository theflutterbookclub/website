import '../entities/hall_of_fame_entry.dart';

abstract class HallOfFameRepository {
  /// Get all hall of fame entries
  Future<List<HallOfFameEntry>> getAllEntries();
  
  /// Get hall of fame entries by category
  Future<List<HallOfFameEntry>> getEntriesByCategory(String category);
  
  /// Get hall of fame entries for a specific member
  Future<List<HallOfFameEntry>> getEntriesByMember(String memberId);
  
  /// Get a specific hall of fame entry by ID
  Future<HallOfFameEntry?> getEntryById(String id);
}
