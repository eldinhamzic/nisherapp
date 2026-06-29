import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/app_chip.dart';
import '../data/competitor_profile.dart';

class CompetitorCard extends StatelessWidget {
  const CompetitorCard({
    super.key,
    required this.competitor,
    required this.onToggle,
  });

  final CompetitorProfile competitor;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final isSelected = competitor.isSelected;

    return AppCard(
      onTap: onToggle,
      backgroundColor: isSelected ? AppColors.primaryGreen.withValues(alpha: 0.04) : AppColors.card,
      borderColor: isSelected ? AppColors.primaryGreen : AppColors.border,
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.background,
            child: Text(
              _initialsFor(competitor.displayName),
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
                  '@${competitor.username}',
                  style: const TextStyle(
                    fontSize: AppSizes.body,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  competitor.followersText,
                  style: const TextStyle(
                    fontSize: AppSizes.caption,
                    color: AppColors.secondaryText,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    AppChip(label: competitor.category, selected: isSelected),
                    AppChip(label: competitor.relevanceLabel, selected: isSelected),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Checkbox(
            value: isSelected,
            onChanged: (_) => onToggle(),
            activeColor: AppColors.primaryGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }

  String _initialsFor(String displayName) {
    final parts = displayName.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) {
      return '?';
    }
    if (parts.length == 1) {
      final word = parts.first;
      return word.substring(0, word.length > 2 ? 2 : word.length).toUpperCase();
    }
    return '${parts.first[0]}${parts[1][0]}'.toUpperCase();
  }
}
