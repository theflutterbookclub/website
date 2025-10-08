import '../../domain/entities/hall_of_fame_entry.dart';

///raw data coming from api (just strings and ints)
class HallOfFameEntryDto {
  final String id;
  final String memberId;
  final String memberName;
  final String achievement;
  final String description;
  final String achievedAt;
  final String category;
  final String? imageUrl;

  const HallOfFameEntryDto({
    required this.id,
    required this.memberId,
    required this.memberName,
    required this.achievement,
    required this.description,
    required this.achievedAt,
    required this.category,
    this.imageUrl,
  });

  factory HallOfFameEntryDto.fromJson(Map<String, dynamic> json) {
    return HallOfFameEntryDto(
      id: json['id'] as String,
      memberId: json['memberId'] as String,
      memberName: json['memberName'] as String,
      achievement: json['achievement'] as String,
      description: json['description'] as String,
      achievedAt: json['achievedAt'] as String,
      category: json['category'] as String,
      imageUrl: json['imageUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'memberId': memberId,
      'memberName': memberName,
      'achievement': achievement,
      'description': description,
      'achievedAt': achievedAt,
      'category': category,
      'imageUrl': imageUrl,
    };
  }

  HallOfFameEntry toEntity() {
    return HallOfFameEntry(
      id: id,
      memberId: memberId,
      memberName: memberName,
      achievement: achievement,
      description: description,
      achievedAt: DateTime.parse(achievedAt),
      category: category,
      imageUrl: imageUrl,
    );
  }

  factory HallOfFameEntryDto.fromEntity(HallOfFameEntry entity) {
    return HallOfFameEntryDto(
      id: entity.id,
      memberId: entity.memberId,
      memberName: entity.memberName,
      achievement: entity.achievement,
      description: entity.description,
      achievedAt: entity.achievedAt.toIso8601String(),
      category: entity.category,
      imageUrl: entity.imageUrl,
    );
  }
}
