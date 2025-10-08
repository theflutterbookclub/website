import 'package:go_router/go_router.dart';
import 'package:tfbc/src/core/navigation/routes.dart';
import 'package:tfbc/src/core/navigation/transitions.dart';
import 'package:tfbc/src/features/sessions/presentation/screens/sessions_screens.dart';

final List<GoRoute> sessionsRoutes = [
  GoRoute(
    path: AppRoutes.sessions,
    pageBuilder: (_, state) {
      return CustomTransitionPage(
        child: const SessionsScreens(),
        transitionsBuilder: slideTransition,
        transitionDuration: const Duration(milliseconds: 500),
      );
    },
  ),
];
