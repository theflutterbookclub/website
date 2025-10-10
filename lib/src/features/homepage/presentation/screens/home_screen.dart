import 'package:flutter/material.dart';
import 'package:tfbc/src/features/homepage/presentation/widgets/footer.dart';
import 'package:tfbc/src/features/homepage/presentation/widgets/how_it_works.dart';
import 'package:tfbc/src/features/homepage/presentation/widgets/social_proof.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [SizedBox(height: 200), SocialProof(), HowItWorks(), Footer()],
        ),
      ),
    );
  }
}
