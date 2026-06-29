import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/app_chip.dart';
import '../../../core/widgets/app_primary_button.dart';

class AiInsightScreen extends StatelessWidget {
  const AiInsightScreen({super.key});

  void _openDashboard(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => const _DashboardPlaceholderScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.pageHorizontalPadding,
            vertical: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'AI preporuka',
                style: TextStyle(
                  fontSize: AppSizes.h1,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Na osnovu konkurencije, sadržaja i aktivne publike.',
                style: TextStyle(
                  fontSize: AppSizes.body,
                  color: AppColors.secondaryText,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              const AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tvoja najveća prilika',
                      style: TextStyle(
                        fontSize: AppSizes.h2,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryText,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Kratki edukativni Reels videi trenutno najbolje prolaze u tvojoj niši.',
                      style: TextStyle(
                        fontSize: AppSizes.body,
                        color: AppColors.primaryText,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const _StatsGrid(),
              const SizedBox(height: 16),
              const Text(
                'Preporuke',
                style: TextStyle(
                  fontSize: AppSizes.h2,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 12),
              const _RecommendationList(),
              const SizedBox(height: 24),
              AppPrimaryButton(
                label: 'Otvori dashboard',
                onPressed: () => _openDashboard(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatsGrid extends StatelessWidget {
  const _StatsGrid();

  @override
  Widget build(BuildContext context) {
    const stats = <String>[
      '124 aktivna profila pronađena',
      '83% prati najmanje 3 slična profila',
      'Najbolje vrijeme za objavu: 19:00 - 22:00',
    ];

    return Column(
      children: [
        for (final stat in stats)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppCard(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Icon(
                    Icons.auto_awesome,
                    color: AppColors.accentYellow,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      stat,
                      style: const TextStyle(
                        fontSize: AppSizes.body,
                        color: AppColors.primaryText,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class _RecommendationList extends StatelessWidget {
  const _RecommendationList();

  @override
  Widget build(BuildContext context) {
    const recommendations = <String>[
      'Objavi kratak video sa konkretnim savjetom',
      'Komentariši kod 10 aktivnih profila dnevno',
      'Prati objave konkurenata koje rastu brže od prosjeka',
    ];

    return Column(
      children: [
        for (final recommendation in recommendations)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppCard(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppChip(label: 'AI', selected: true),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      recommendation,
                      style: const TextStyle(
                        fontSize: AppSizes.body,
                        color: AppColors.primaryText,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class _DashboardPlaceholderScreen extends StatelessWidget {
  const _DashboardPlaceholderScreen();

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
                  'Dashboard',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppSizes.h1,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryText,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Placeholder za naredni korak.',
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
