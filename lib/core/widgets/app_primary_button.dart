import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.enabled = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.primaryButtonHeight,
      child: FilledButton(
        onPressed: enabled ? onPressed : null,
        style: FilledButton.styleFrom(
          backgroundColor: enabled ? AppColors.primaryGreen : AppColors.disabled,
          foregroundColor: enabled ? Colors.white : AppColors.secondaryText,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: AppSizes.button,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
