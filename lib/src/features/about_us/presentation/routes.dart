import 'package:go_router/go_router.dart';
import 'package:tfbc/src/core/navigation/routes.dart';
import 'package:tfbc/src/core/navigation/transitions.dart';
import 'package:tfbc/src/features/about_us/presentation/screens/about_us_screen.dart';

final List<GoRoute> aboutRoutes = [
  GoRoute(
    path: AppRoutes.aboutUs,
    pageBuilder: (_, state) {
      return CustomTransitionPage(
        child: const AboutUsScreen(),
        transitionsBuilder: slideTransition,
        transitionDuration: const Duration(milliseconds: 500),
      );
    },
  ),
];
