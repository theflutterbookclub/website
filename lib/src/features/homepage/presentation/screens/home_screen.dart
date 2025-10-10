import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tfbc/src/core/navigation/routes.dart';
import 'package:tfbc/src/core/ui/ui.dart';
import 'package:tfbc/src/core/widgets/app_button.dart';
import 'package:tfbc/src/core/utils/responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to The Flutter Book Club',
              style: AppTextStyles.bold.copyWith(
                fontSize: FontSizes.h1(context),
                fontFamily: "OriginalSurfer",
              ),
            ),
            SizedBox(height: Spacings.lg(context)),
            Text(
              'We are happy to meet you',
              style: AppTextStyles.regular.copyWith(
                fontSize: FontSizes.bodyLarge(context),
              ),
            ),
            SizedBox(height: Spacings.xl(context)),
            AppButton(
              text: "About Us",
              width: 200,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
