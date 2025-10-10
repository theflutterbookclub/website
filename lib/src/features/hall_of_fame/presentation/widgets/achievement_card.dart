import 'package:flutter/material.dart';
import '../../domain/entities/hall_of_fame_entry.dart';

class AchievementCard extends StatefulWidget {
  final HallOfFameEntry entry;
  final VoidCallback onTap;
  final double angle;
  final Color? color;
  const AchievementCard({
    super.key,
    required this.entry,
    required this.onTap,
    this.angle = -0.1,
    this.color,
  });

  @override
  State<AchievementCard> createState() => _AchievementCardState();
}

class _AchievementCardState extends State<AchievementCard> {
  double angle = 0;
  @override
  void initState() {
    angle = widget.angle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: MouseRegion(
        onHover: (event) {
          setState(() {
            angle = widget.angle == 0 ? 0.1 : -widget.angle;
          });
          widget.onTap();
        },
        onExit: (event) {
          setState(() {
            angle = widget.angle;
          });
        },
        child: Transform.rotate(
          angle: angle,
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: widget.color ?? Colors.yellowAccent,
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              onTap: widget.onTap,
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      'https://tse3.mm.bing.net/th/id/OIP.kN8tEO6_wPf1PMEofLrdTgHaGh?cb=12&rs=1&pid=ImgDetMain&o=7&rm=3',
                      height: 300,
                      fit: BoxFit.cover,
                      frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) =>
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: child,
                              ),
                      width: 400,
                      errorBuilder: (context, error, stackTrace) => Container(),
                    ),
                    // Row(
                    //   children: [
                    //     Container(
                    //       padding: const EdgeInsets.symmetric(
                    //         horizontal: 12,
                    //         vertical: 6,
                    //       ),
                    //       decoration: BoxDecoration(
                    //         color: _getCategoryColor(entry.category),
                    //         borderRadius: BorderRadius.circular(20),
                    //       ),
                    //       child: Text(
                    //         entry.category,
                    //         style: const TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 12,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //     ),
                    //     const Spacer(),
                    //     Icon(Icons.star, color: Colors.amber[600], size: 20),
                    //   ],
                    // ),
                    Text(
                      widget.entry.achievement,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    Text(
                      widget.entry.memberName,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Expanded(
                      child: Text(
                        widget.entry.description,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          height: 1.4,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    // Row(
                    //   children: [
                    //     Icon(Icons.calendar_today, size: 16, color: Colors.grey[500]),
                    //     const SizedBox(width: 4),
                    //     Text(
                    //       _formatDate(entry.achievedAt),
                    //       style: Theme.of(
                    //         context,
                    //       ).textTheme.bodySmall?.copyWith(color: Colors.grey[500]),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'reading':
        return Colors.blue;
      case 'leadership':
        return Colors.purple;
      case 'community':
        return Colors.green;
      case 'innovation':
        return Colors.orange;
      case 'mentorship':
        return Colors.teal;
      case 'technology':
        return Colors.indigo;
      default:
        return Colors.grey;
    }
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
