import 'package:flutter/material.dart';
import 'package:tfbc/src/common/special_text.dart';
import '../../domain/entities/hall_of_fame_entry.dart';

class HallOfFameDetailsPanel extends StatelessWidget {
  final HallOfFameEntry entry;
  final VoidCallback onClose;

  const HallOfFameDetailsPanel({
    super.key,
    required this.entry,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border(left: BorderSide(color: Colors.grey[300]!, width: 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SpecialText(
                'Flutter Book Club Spotlight',
                fontSize: 24,
                fontWeight: FontWeight.w600,
                fontfamily: 'BBHSansBogle',
                color: Colors.grey[800],
              ),
              IconButton(
                onPressed: onClose,
                icon: Icon(Icons.close, color: Colors.grey[600]),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Member photo placeholder
          Center(
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
                border: Border.all(color: Colors.grey[300]!, width: 2),
              ),
              child: Icon(Icons.person, size: 60, color: Colors.grey[400]),
            ),
          ),
          const SizedBox(height: 20),

          // Member name
          Center(
            child: SpecialText(
              entry.memberName,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontfamily: 'BBHSansBogle',
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 8),

          // Achievement title
          Center(
            child: SpecialText(
              entry.achievement,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontfamily: 'EBGaramond',
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 24),

          // Category badge
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: _getCategoryColor(entry.category),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                entry.category,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Description
          Text(
            'Achievement Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
              fontFamily: 'BBHSansBogle',
            ),
          ),
          const SizedBox(height: 12),

          Expanded(
            child: SingleChildScrollView(
              child: Text(
                entry.description,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.grey[700],
                  fontFamily: 'EBGaramond',
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Achievement date
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.calendar_today, size: 20, color: Colors.grey[600]),
                const SizedBox(width: 8),
                Text(
                  'Achieved on ${_formatDate(entry.achievedAt)}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Congratulations message
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue[200]!, width: 1),
            ),
            child: Row(
              children: [
                Icon(Icons.star, size: 20, color: Colors.blue[600]),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Congratulations on this outstanding achievement!',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
