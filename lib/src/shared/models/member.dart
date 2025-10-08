class Member {
  final String id;
  final String name;
  final String role;
  final DateTime joinedAt;

  const Member({
    required this.id,
    required this.name,
    required this.role,
    required this.joinedAt,
  });

  Member copyWith({
    String? id,
    String? name,
    String? role,
    DateTime? joinedAt,
  }) {
    return Member(
      id: id ?? this.id,
      name: name ?? this.name,
      role: role ?? this.role,
      joinedAt: joinedAt ?? this.joinedAt,
    );
  }

  @override
  String toString() => 'Member(id: $id, name: $name, role: $role, joinedAt: $joinedAt)';
}
