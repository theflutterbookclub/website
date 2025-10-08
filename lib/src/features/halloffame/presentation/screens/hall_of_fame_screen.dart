import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/hall_of_fame_providers.dart';
import '../widgets/achievement_card.dart';

class HallOfFameScreen extends ConsumerStatefulWidget {
  const HallOfFameScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HallOfFameScreen> createState() => _HallOfFameScreenState();
}

class _HallOfFameScreenState extends ConsumerState<HallOfFameScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(hallOfFameNotifierProvider.notifier).loadEntries();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(hallOfFameNotifierProvider);
    final notifier = ref.read(hallOfFameNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hall of Fame'),
        backgroundColor: Colors.amber[600],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: _buildBody(state, notifier),
    );
  }

  Widget _buildBody(state, notifier) {
    if (state.isLoading && state.entries.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
            const SizedBox(height: 16),
            Text(
              state.error!,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => notifier.loadEntries(),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (state.entries.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.emoji_events_outlined, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No achievements yet',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        _buildCategoryFilter(state, notifier),
        Expanded(child: _buildEntriesList(state, notifier)),
      ],
    );
  }

  Widget _buildCategoryFilter(state, notifier) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: state.categories.length,
        itemBuilder: (context, index) {
          final category = state.categories[index];
          final isSelected = category == state.selectedCategory;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  notifier.selectCategory(category);
                  if (category == 'All') {
                    notifier.loadEntries();
                  } else {
                    notifier.loadEntriesByCategory(category);
                  }
                }
              },
              selectedColor: Colors.amber[100],
              checkmarkColor: Colors.amber[800],
            ),
          );
        },
      ),
    );
  }

  Widget _buildEntriesList(state, notifier) {
    final entries = state.filteredEntries;

    if (entries.isEmpty) {
      return const Center(
        child: Text(
          'No entries found for this category',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => notifier.loadEntries(),
      child: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          final entry = entries[index];
          return AchievementCard(
            entry: entry,
            onTap: () => _showEntryDetails(context, entry),
          );
        },
      ),
    );
  }

  void _showEntryDetails(BuildContext context, entry) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(entry.achievement),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Member: ${entry.memberName}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(entry.description),
            const SizedBox(height: 8),
            Text(
              'Category: ${entry.category}',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 4),
            Text(
              'Achieved: ${_formatDate(entry.achievedAt)}',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
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
