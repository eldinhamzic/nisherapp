import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/widgets/app_progress_bar.dart';
import '../../competitors/presentation/competitor_selection_screen.dart';

class AnalysisLoadingScreen extends StatefulWidget {
  const AnalysisLoadingScreen({super.key});

  @override
  State<AnalysisLoadingScreen> createState() => _AnalysisLoadingScreenState();
}

class _AnalysisLoadingScreenState extends State<AnalysisLoadingScreen> {
  Timer? _timer;
  double _progress = 0;
  bool _navigated = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      setState(() {
        _progress = (_progress + 0.02).clamp(0, 1);
      });

      if (_progress >= 1 && !_navigated) {
        _navigated = true;
        timer.cancel();
        Future<void>.delayed(Duration.zero, () {
          if (!mounted) {
            return;
          }
          Navigator.of(context).pushReplacement(
            MaterialPageRoute<void>(
              builder: (_) => const CompetitorSelectionScreen(),
            ),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final percentage = (_progress * 100).round();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.pageHorizontalPadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                const Text(
                  'AI analizira tvoju nišu...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppSizes.h1,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryText,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  'Pronalazi konkurenciju, analizira sadržaj i pratioce.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppSizes.body,
                    color: AppColors.secondaryText,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Analiza u toku...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppSizes.body,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                ),
                const SizedBox(height: 16),
                AppProgressBar(value: _progress),
                const SizedBox(height: 12),
                Text(
                  '$percentage%',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: AppSizes.caption,
                    color: AppColors.secondaryText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
