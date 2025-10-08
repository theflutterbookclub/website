import 'package:flutter/material.dart';
import 'package:tfbc/src/core/ui/ui.dart';
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
                fontFamily: "Ransom",
              ),
            ),
            SizedBox(height: Spacings.xl(context)),
            Text(
              'We are happy to meet you',
              style: AppTextStyles.medium.copyWith(
                fontSize: FontSizes.bodyLarge(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
