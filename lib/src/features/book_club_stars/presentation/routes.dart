import 'package:go_router/go_router.dart';
import 'package:tfbc/src/core/navigation/routes.dart';
import 'package:tfbc/src/core/navigation/transitions.dart';
import 'package:tfbc/src/features/book_club_stars/presentation/screens/book_club_stars_screen.dart';

final List<GoRoute> clubStarsRoutes = [
  GoRoute(
    path: AppRoutes.clubStars,
    pageBuilder: (_, state) {
      return CustomTransitionPage(
        child: const BookClubStarsScreen(),
        transitionsBuilder: slideTransition,
        transitionDuration: const Duration(milliseconds: 500),
      );
    },
  ),
];
