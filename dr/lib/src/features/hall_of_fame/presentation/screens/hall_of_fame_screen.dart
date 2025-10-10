import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfbc/src/common/special_text.dart';
import 'package:tfbc/src/features/hall_of_fame/presentation/notifiers/providers/hall_of_fame_providers.dart';
import 'package:tfbc/src/features/hall_of_fame/presentation/widgets/achievement_card.dart';
import 'package:tfbc/src/features/hall_of_fame/presentation/widgets/hall_of_fame_details_panel.dart';

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
          Expanded(
            child: Column(
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
                        child: GridView.builder(
                          itemCount: 6,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisExtent: 450,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                crossAxisCount: 3,
                              ),
                          itemBuilder: (context, index) {
                            return Center(
                              child: AchievementCard(
                                color: Colors.accents[index],
                                entry: state.entries[index],
                                angle: (index % 3 == 0
                                    ? 0.1
                                    : index % 2 == 0
                                    ? -0.1
                                    : index % 2 == 1
                                    ? 0
                                    : 0.1),
                                onTap: () =>
                                    notifier.selectEntry(state.entries[index]),
                              ),
                            );
                          },
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
          ),
        ],
      ),
    );
  }
}
