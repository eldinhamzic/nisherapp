import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/widgets/app_primary_button.dart';
import '../../../core/widgets/app_text_input.dart';
import 'viral_content_screen.dart';
import 'competitor_card.dart';
import 'competitor_selection_controller.dart';

class CompetitorSelectionScreen extends ConsumerStatefulWidget {
  const CompetitorSelectionScreen({super.key});

  @override
  ConsumerState<CompetitorSelectionScreen> createState() =>
      _CompetitorSelectionScreenState();
}

class _CompetitorSelectionScreenState
    extends ConsumerState<CompetitorSelectionScreen> {
  final TextEditingController _manualController = TextEditingController();

  @override
  void dispose() {
    _manualController.dispose();
    super.dispose();
  }

  void _addManualCompetitor() {
    final username = _manualController.text.trim();
    if (username.isEmpty) {
      return;
    }

    ref.read(competitorSelectionProvider.notifier).addManualCompetitor(username);
    _manualController.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final competitors = ref.watch(competitorSelectionProvider);
    final selectedCount = competitors.where((competitor) => competitor.isSelected).length;

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
                'Pronađi svoju konkurenciju',
                style: TextStyle(
                  fontSize: AppSizes.h1,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Odaberi konkurente koje želiš pratiti.',
                style: TextStyle(
                  fontSize: AppSizes.body,
                  color: AppColors.secondaryText,
                ),
              ),
              const SizedBox(height: 24),
              const AppTextInput(
                hintText: 'Pretraži korisnike...',
              ),
              const SizedBox(height: 24),
              const Text(
                'Predloženi konkurenti',
                style: TextStyle(
                  fontSize: AppSizes.h2,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 12),
              ListView.separated(
                itemCount: competitors.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final competitor = competitors[index];
                  return CompetitorCard(
                    competitor: competitor,
                    onToggle: () {
                      ref
                          .read(competitorSelectionProvider.notifier)
                          .toggleSelection(competitor.username);
                    },
                  );
                },
              ),
              const SizedBox(height: 24),
              const Text(
                'Dodaj konkurenta ručno',
                style: TextStyle(
                  fontSize: AppSizes.h2,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 12),
              AppTextInput(
                controller: _manualController,
                hintText: 'Unesite ime korisnika',
                onSubmitted: (_) => _addManualCompetitor(),
                suffixIcon: IconButton(
                  onPressed: _addManualCompetitor,
                  icon: const Icon(Icons.add_circle_outline),
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 24),
              AppPrimaryButton(
                label: 'Nastavi ($selectedCount)',
                enabled: selectedCount > 0,
                onPressed: selectedCount > 0
                    ? () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => const ViralContentScreen(),
                          ),
                        );
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
