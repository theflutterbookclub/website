import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tfbc/src/core/ui/ui.dart';
import 'package:tfbc/src/core/utils/responsive.dart';

class AppButton extends StatefulWidget {
  final bool loading;
  final bool active;
  final String? text;
  final VoidCallback onPressed;
  final Widget? child;
  final double? width;

  const AppButton({
    super.key,
    this.text,
    this.width,
    this.active = true,
    required this.onPressed,
    this.child,
    this.loading = false,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        if (widget.loading || !widget.active) return;
        widget.onPressed();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: widget.width ?? double.infinity,
        height: 56,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 50),
                height: 56 - (_isPressed ? 4.0 : 0),
                decoration: BoxDecoration(
                  color: widget.active ? const Color(0xFF017B85) : AppColors.outline,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            // Top button layer
            AnimatedPositioned(
              duration: const Duration(milliseconds: 100),
              bottom: _isPressed ? 0 : 4.0,
              left: 0,
              right: 0,
              child: Container(
                height: 56 - 4.0,
                decoration: BoxDecoration(
                  color: widget.active
                      ? AppColors.primary
                      : AppColors.primary.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: widget.child == null
                      ? Text(
                    widget.text ?? "",
                    style: AppTextStyles.semiBold.copyWith(
                      color: Colors.white,
                      fontSize: FontSizes.h5(context),
                    ),
                  ).animate().move(
                    delay: const Duration(milliseconds: 50),
                  )
                      : widget.child!
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}