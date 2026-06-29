import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppProgressBar extends StatelessWidget {
  const AppProgressBar({
    super.key,
    required this.value,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: LinearProgressIndicator(
        value: value,
        minHeight: 8,
        backgroundColor: AppColors.border,
        valueColor: const AlwaysStoppedAnimation<Color>(AppColors.accentYellow),
      ),
    );
  }
}
