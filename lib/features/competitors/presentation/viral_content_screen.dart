import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/app_chip.dart';
import '../../../core/widgets/app_primary_button.dart';
import '../data/mock_viral_content_items.dart';
import '../data/viral_content_item.dart';
import 'active_profiles_placeholder_screen.dart';

class ViralContentScreen extends StatelessWidget {
  const ViralContentScreen({super.key});

  void _openNext(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => const ActiveProfilesPlaceholderScreen(),
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
              const _Header(),
              const SizedBox(height: 24),
              ...mockViralContentItems.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _ViralContentCard(item: item),
                ),
              ),
              const SizedBox(height: 12),
              AppPrimaryButton(
                label: 'Prikaži aktivne profile',
                onPressed: () => _openNext(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sadržaj koji dominira',
          style: TextStyle(
            fontSize: AppSizes.h1,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryText,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Objave koje trenutno najbolje prolaze kod tvoje konkurencije.',
          style: TextStyle(
            fontSize: AppSizes.body,
            color: AppColors.secondaryText,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class _ViralContentCard extends StatelessWidget {
  const _ViralContentCard({required this.item});

  final ViralContentItem item;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
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
                    const SizedBox(height: 4),
                    Text(
                      item.contentType,
                      style: const TextStyle(
                        fontSize: AppSizes.caption,
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
              AppChip(label: item.performanceLabel, selected: true),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              AppChip(label: item.viewsText, selected: true),
              AppChip(label: item.likesText, selected: false),
              AppChip(label: item.commentsText, selected: false),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            item.insight,
            style: const TextStyle(
              fontSize: AppSizes.body,
              color: AppColors.primaryText,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  String _initials(String username) {
    final clean = username.replaceFirst('@', '');
    final parts = clean.split('_');
    if (parts.length == 1) {
      return clean.substring(0, clean.length > 2 ? 2 : clean.length).toUpperCase();
    }
    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }
}
