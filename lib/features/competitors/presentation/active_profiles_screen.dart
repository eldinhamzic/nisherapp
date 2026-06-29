import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/app_chip.dart';
import '../../../core/widgets/app_primary_button.dart';
import '../data/active_profile_item.dart';
import '../data/mock_active_profile_items.dart';
import 'ai_insight_screen.dart';

class ActiveProfilesScreen extends StatelessWidget {
  const ActiveProfilesScreen({super.key});

  void _openNext(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => const AiInsightScreen(),
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
                'Profili vrijedni pažnje',
                style: TextStyle(
                  fontSize: AppSizes.h1,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Korisnici koji aktivno komuniciraju sa sadržajem iz tvoje niše.',
                style: TextStyle(
                  fontSize: AppSizes.body,
                  color: AppColors.secondaryText,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              ...mockActiveProfileItems.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _ActiveProfileCard(item: item),
                ),
              ),
              const SizedBox(height: 12),
              AppPrimaryButton(
                label: 'Sačuvaj listu',
                onPressed: () => _openNext(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActiveProfileCard extends StatelessWidget {
  const _ActiveProfileCard({required this.item});

  final ActiveProfileItem item;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.background,
            child: Text(
              _initials(item.username),
              style: const TextStyle(
                fontSize: AppSizes.caption,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryText,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '@${item.username}',
                  style: const TextStyle(
                    fontSize: AppSizes.body,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryText,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item.activitySummary,
                  style: const TextStyle(
                    fontSize: AppSizes.body,
                    color: AppColors.secondaryText,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    AppChip(label: item.relevanceBadge, selected: true),
                    AppChip(label: item.suggestedAction, selected: false),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _initials(String username) {
    final clean = username.replaceAll('.', '').replaceAll('_', '');
    if (clean.isEmpty) {
      return '?';
    }
    return clean.substring(0, clean.length > 2 ? 2 : clean.length).toUpperCase();
  }
}
