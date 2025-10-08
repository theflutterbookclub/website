class HallOfFameEntry {
  final String id;
  final String memberId;
  final String memberName;
  final String achievement;
  final String description;
  final DateTime achievedAt;
  final String category;
  final String? imageUrl;

  const HallOfFameEntry({
    required this.id,
    required this.memberId,
    required this.memberName,
    required this.achievement,
    required this.description,
    required this.achievedAt,
    required this.category,
    this.imageUrl,
  });

  HallOfFameEntry copyWith({
    String? id,
    String? memberId,
    String? memberName,
    String? achievement,
    String? description,
    DateTime? achievedAt,
    String? category,
    String? imageUrl,
  }) {
    return HallOfFameEntry(
      id: id ?? this.id,
      memberId: memberId ?? this.memberId,
      memberName: memberName ?? this.memberName,
      achievement: achievement ?? this.achievement,
      description: description ?? this.description,
      achievedAt: achievedAt ?? this.achievedAt,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  String toString() =>
      'HallOfFameEntry(id: $id, memberName: $memberName, achievement: $achievement, category: $category)';
}
