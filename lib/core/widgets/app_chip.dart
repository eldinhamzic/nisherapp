import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    required this.label,
    this.selected = false,
  });

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: selected ? AppColors.primaryGreen.withOpacity(0.08) : AppColors.background,
        borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
        border: Border.all(color: selected ? AppColors.primaryGreen : AppColors.border),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: AppSizes.caption,
          color: selected ? AppColors.primaryGreen : AppColors.secondaryText,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
