import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/widgets/app_primary_button.dart';

class ActiveProfilesPlaceholderScreen extends StatelessWidget {
  const ActiveProfilesPlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.pageHorizontalPadding,
            vertical: 24,
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Aktivni profili',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppSizes.h1,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryText,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Placeholder screen za naredni korak.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppSizes.body,
                    color: AppColors.secondaryText,
                  ),
                ),
                const SizedBox(height: 24),
                AppPrimaryButton(
                  label: 'Nazad',
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
