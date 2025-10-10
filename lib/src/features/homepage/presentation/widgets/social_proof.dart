import 'package:flutter/material.dart';
import 'package:tfbc/src/core/ui/ui.dart';
import 'package:tfbc/src/core/utils/responsive.dart';
import 'package:tfbc/src/features/homepage/domain/testimonial.dart';

class SocialProof extends StatefulWidget {
  const SocialProof({super.key});

  @override
  State<SocialProof> createState() => _SocialProofState();
}

class _SocialProofState extends State<SocialProof>
    with TickerProviderStateMixin {
  late AnimationController circleScaleController;
  late Animation<double> circleScaleAnimation;
  late final List<Testimonial> testimonials;

  @override
  void initState() {
    super.initState();

    circleScaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
    )..repeat(reverse: true);
    circleScaleAnimation = Tween<double>(begin: 1.0, end: 1.8).animate(
      CurvedAnimation(parent: circleScaleController, curve: Curves.easeInOut),
    );

    testimonials = [
      Testimonial(
        image: "assets/images/man.jpg",
        name: "John Doe",
        position: "Flutter Developer",
        quote:
            "Flutter is the best framework for building cross-platform apps. I love it!",
      ),
      Testimonial(
        image: "assets/images/man.jpg",
        name: "Jane Smith",
        position: "Flutter Developer",
        quote:
            "Flutter is the best framework for building cross-platform apps. I love it!",
      ),
      Testimonial(
        image: "assets/images/man.jpg",
        name: "John Doe",
        position: "Flutter Developer",
        quote:
            "Flutter is the best framework for building cross-platform apps. I love it!",
      ),
    ];
  }

  @override
  void dispose() {
    circleScaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.background,
      child: Stack(
        children: [
          ScaleTransition(
            scale: circleScaleAnimation,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.tertiary.withValues(alpha: 0.1),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "Proof in the "),
                      TextSpan(
                        text: "Code",
                        style: TextStyle(color: AppColors.tertiary),
                      ),
                    ],
                  ),
                  style: AppTextStyles.bold.copyWith(
                    color: AppColors.dark,
                    fontSize: FontSizes.h2(context),
                    fontFamily: "OriginalSurfer",
                  ),
                ),
                SizedBox(height: Spacings.xs(context)),
                Text(
                  "Hear from the engineers who are leveling up their Flutter skills",
                  style: AppTextStyles.regular.copyWith(
                    color: AppColors.grey,
                    fontSize: FontSizes.bodyLarge(context),
                  ),
                ),
                SizedBox(height: Spacings.xxxl(context)),
                Container(
                  width: 800,
                  height: 400,
                  decoration: BoxDecoration(
                    color: AppColors.tertiary.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
