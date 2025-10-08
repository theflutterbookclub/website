import 'package:go_router/go_router.dart';
import 'package:tfbc/src/core/navigation/routes.dart';
import 'package:tfbc/src/core/navigation/transitions.dart';
import 'package:tfbc/src/features/hall_of_fame/presentation/screens/hall_of_fame_screen.dart';

final List<GoRoute> hallOfFameRoutes = [
  GoRoute(
    path: AppRoutes.hallOfFame,
    pageBuilder: (_, state) {
      return CustomTransitionPage(
        child: const HallOfFameScreen(),
        transitionsBuilder: slideTransition,
        transitionDuration: const Duration(milliseconds: 500),
      );
    },
  ),
];
