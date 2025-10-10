import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfbc/src/common/special_text.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../notifiers/providers/hall_of_fame_providers.dart';
import '../widgets/achievement_card.dart';
import '../widgets/hall_of_fame_details_panel.dart';
import '../../domain/entities/hall_of_fame_entry.dart';

class HallOfFameScreen extends ConsumerStatefulWidget {
  const HallOfFameScreen({super.key});

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
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SpecialText(
                '2025 Hall of Fame',
                fontSize: 50,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w600,
                fontfamily: 'BBHSansBogle',
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Skeletonizer(
                        enabled: state.isLoading,
                        child: GridView.builder(
                          itemCount: state.isLoading
                              ? _placeholderEntries.length
                              : state.entries.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisExtent: 450,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                crossAxisCount: 3,
                              ),
                          itemBuilder: (context, index) {
                            final entries = state.isLoading
                                ? _placeholderEntries
                                : state.entries;
                            return Center(
                              child: AchievementCard(
                                color: Colors.accents[
                                  index % Colors.accents.length
                                ],
                                entry: entries[index],
                                angle: (index % 3 == 0
                                    ? 0.1
                                    : index % 2 == 0
                                    ? -0.1
                                    : index % 2 == 1
                                    ? 0
                                    : 0.1),
                                onTap: () => notifier.selectEntry(
                                  state.isLoading ? null : entries[index],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    if (state.selectedEntry != null)
                      Expanded(
                        child: HallOfFameDetailsPanel(
                          entry: state.selectedEntry!,
                          onClose: () => notifier.selectEntry(null),
                        ),
                      )
                    else
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.touch_app,
                                size: 64,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Select an achievement\nto view details',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[600],
                                  fontFamily: 'BBHSansBogle',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Local placeholder entries used to render skeletons during loading
final List<HallOfFameEntry> _placeholderEntries = List.generate(
  9,
  (i) => HallOfFameEntry(
    id: 'placeholder_$i',
    memberId: 'member_$i',
    memberName: 'Member Name',
    achievement: 'Achievement title',
    description: 'Short description of the achievement goes here.',
    achievedAt: DateTime.now(),
    category: 'All',
  ),
);
