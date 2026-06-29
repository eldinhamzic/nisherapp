import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/widgets/app_secondary_button.dart';
import '../../analysis/presentation/analysis_loading_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _openAnalysis(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => const AnalysisLoadingScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.pageHorizontalPadding,
          ),
          child: Center(
            child: Transform.translate(
              offset: const Offset(0, -24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 24),
                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const Text(
                          'NICHER',
                          style: TextStyle(
                            fontSize: AppSizes.logoSize,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                            color: AppColors.primaryText,
                          ),
                        ),
                        const Positioned(
                          right: -10,
                          top: -8,
                          child: Text(
                            '✦',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.accentYellow,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  const Text.rich(
                    TextSpan(
                      text: 'Budi u ',
                      style: TextStyle(
                        fontSize: AppSizes.h1,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryText,
                        height: 1.15,
                      ),
                      children: [
                        TextSpan(
                          text: 'trendu',
                          style: TextStyle(color: AppColors.accentYellow),
                        ),
                        TextSpan(text: '.\nRasti '),
                        TextSpan(
                          text: 'brže',
                          style: TextStyle(color: AppColors.accentYellow),
                        ),
                        TextSpan(text: '.'),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Pronađi konkurenciju, analiziraj sadržaj i otkrij šta funkcioniše. Pretvori uvide u rezultate.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppSizes.body,
                      color: AppColors.secondaryText,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 28),
                  AppSecondaryButton(
                    label: 'Nastavi sa Instagramom',
                    leading: const _SocialBadge(label: 'IG'),
                    onPressed: () => _openAnalysis(context),
                  ),
                  const SizedBox(height: 12),
                  AppSecondaryButton(
                    label: 'Nastavi sa TikTokom',
                    leading: const _SocialBadge(label: 'TT'),
                    onPressed: () => _openAnalysis(context),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Nastavkom prihvatate uslove korištenja i politiku privatnosti.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppSizes.caption,
                      color: AppColors.secondaryText,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialBadge extends StatelessWidget {
  const _SocialBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryText,
        ),
      ),
    );
  }
}
