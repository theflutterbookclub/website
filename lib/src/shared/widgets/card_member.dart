import 'package:flutter/material.dart';
import 'package:tfbc/src/core/models/member.dart';

class MemberCard extends StatelessWidget {
  final Member member;
  final VoidCallback? onTap;

  const MemberCard({Key? key, required this.member, this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(member.name),
        subtitle: Text(member.role),
        trailing: Text(
          '${member.joinedAt.year}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
