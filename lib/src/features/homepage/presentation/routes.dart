import 'package:go_router/go_router.dart';
import 'package:tfbc/src/core/navigation/routes.dart';
import 'package:tfbc/src/core/navigation/transitions.dart';
import 'package:tfbc/src/features/homepage/presentation/screens/home_screen.dart';

final List<GoRoute> homepageRoutes = [
  GoRoute(
    path: AppRoutes.homepage,
    pageBuilder: (_, state) {
      return CustomTransitionPage(
        child: const HomeScreen(),
        transitionsBuilder: slideTransition,
        transitionDuration: const Duration(milliseconds: 500),
      );
    },
  ),
];
