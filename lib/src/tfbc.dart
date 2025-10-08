import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tfbc/src/core/navigation/routes.dart';
import 'package:tfbc/src/core/ui/themes.dart';
import 'package:tfbc/src/features/about_us/presentation/routes.dart';
import 'package:tfbc/src/features/articles/presentation/routes.dart';
import 'package:tfbc/src/features/book_club_stars/presentation/routes.dart';
import 'package:tfbc/src/features/hall_of_fame/presentation/routes.dart';
import 'package:tfbc/src/features/homepage/presentation/routes.dart';
import 'package:tfbc/src/features/sessions/presentation/routes.dart';

import 'core/utils/responsive.dart';

class TFBC extends ConsumerStatefulWidget {
  const TFBC({super.key});

  @override
  ConsumerState<TFBC> createState() => _TFBCState();
}

class _TFBCState extends ConsumerState<TFBC> {
  late GoRouter router;

  @override
  void initState() {
    super.initState();
    router = GoRouter(
      initialLocation: AppRoutes.homepage,
      routes: [
        ...homepageRoutes,
        ...articlesRoutes,
        ...aboutRoutes,
        ...clubStarsRoutes,
        ...sessionsRoutes,
        ...hallOfFameRoutes,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Book Club Website',
      theme: lightTheme,
      themeMode: ThemeMode.light,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(
              start: 0,
              end: 374,
              name: AppBreakPoints.smallMobile,
            ),
            const Breakpoint(
              start: 375,
              end: 480,
              name: AppBreakPoints.normalMobile,
            ),
            const Breakpoint(
              start: 481,
              end: 767,
              name: AppBreakPoints.largeMobile,
            ),
            const Breakpoint(
              start: 768,
              end: 1023,
              name: AppBreakPoints.portraitTablet,
            ),
            const Breakpoint(
              start: 1024,
              end: 1210,
              name: AppBreakPoints.landscapeTablet,
            ),
            const Breakpoint(
              start: 1211,
              end: double.infinity,
              name: AppBreakPoints.desktop,
            ),
          ],
        );
      },
    );
  }
}
