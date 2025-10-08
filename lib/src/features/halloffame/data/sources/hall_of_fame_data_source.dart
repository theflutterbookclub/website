import '../models/hall_of_fame_entry_dto.dart';

abstract class HallOfFameDataSource {
  Future<List<HallOfFameEntryDto>> getAllEntries();
  Future<List<HallOfFameEntryDto>> getEntriesByCategory(String category);
  Future<List<HallOfFameEntryDto>> getEntriesByMember(String memberId);
  Future<HallOfFameEntryDto?> getEntryById(String id);
}

class MockHallOfFameDataSource implements HallOfFameDataSource {
  final List<HallOfFameEntryDto> _mockEntries = [
    const HallOfFameEntryDto(
      id: '1',
      memberId: 'member1',
      memberName: 'Sarah Johnson',
      achievement: 'Book Reading Champion',
      description: 'Read 50 books in a single year, setting a new club record.',
      achievedAt: '2024-01-15T10:00:00Z',
      category: 'Reading',
      imageUrl: null,
    ),
    const HallOfFameEntryDto(
      id: '2',
      memberId: 'member2',
      memberName: 'Michael Chen',
      achievement: 'Discussion Leader',
      description:
          'Led 20+ engaging book discussions with 95% member satisfaction.',
      achievedAt: '2024-02-20T14:30:00Z',
      category: 'Leadership',
      imageUrl: null,
    ),
    const HallOfFameEntryDto(
      id: '3',
      memberId: 'member3',
      memberName: 'Emily Rodriguez',
      achievement: 'Community Builder',
      description:
          'Organized 15 successful book club events and social gatherings.',
      achievedAt: '2024-03-10T09:15:00Z',
      category: 'Community',
      imageUrl: null,
    ),
    const HallOfFameEntryDto(
      id: '4',
      memberId: 'member4',
      memberName: 'David Thompson',
      achievement: 'Genre Explorer',
      description: 'Successfully introduced the club to 5 new literary genres.',
      achievedAt: '2024-04-05T16:45:00Z',
      category: 'Innovation',
      imageUrl: null,
    ),
    const HallOfFameEntryDto(
      id: '5',
      memberId: 'member5',
      memberName: 'Lisa Wang',
      achievement: 'Mentor of the Year',
      description:
          'Mentored 10 new members and helped them integrate into the club.',
      achievedAt: '2024-05-12T11:20:00Z',
      category: 'Mentorship',
      imageUrl: null,
    ),
    const HallOfFameEntryDto(
      id: '6',
      memberId: 'member6',
      memberName: 'James Wilson',
      achievement: 'Digital Pioneer',
      description:
          'Created and maintained the club\'s online presence and digital resources.',
      achievedAt: '2024-06-18T13:10:00Z',
      category: 'Technology',
      imageUrl: null,
    ),
  ];

  @override
  Future<List<HallOfFameEntryDto>> getAllEntries() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return List.from(_mockEntries);
  }

  @override
  Future<List<HallOfFameEntryDto>> getEntriesByCategory(String category) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockEntries.where((entry) => entry.category == category).toList();
  }

  @override
  Future<List<HallOfFameEntryDto>> getEntriesByMember(String memberId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockEntries.where((entry) => entry.memberId == memberId).toList();
  }

  @override
  Future<HallOfFameEntryDto?> getEntryById(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    try {
      return _mockEntries.firstWhere((entry) => entry.id == id);
    } catch (e) {
      return null;
    }
  }
}
