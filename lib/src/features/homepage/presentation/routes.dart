import 'package:go_router/go_router.dart';
import 'package:tfbc/src/core/navigation/routes.dart';
import 'package:tfbc/src/core/navigation/transitions.dart';
import 'package:tfbc/src/features/about_us/presentation/screens/about_us_screen.dart';
import 'package:tfbc/src/features/articles/presentation/screens/articles_screen.dart';
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
