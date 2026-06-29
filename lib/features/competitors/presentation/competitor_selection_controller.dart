import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/competitor_profile.dart';
import '../data/mock_competitors.dart';

final competitorSelectionProvider =
    NotifierProvider<CompetitorSelectionController, List<CompetitorProfile>>(
  CompetitorSelectionController.new,
);

class CompetitorSelectionController extends Notifier<List<CompetitorProfile>> {
  @override
  List<CompetitorProfile> build() => mockCompetitors;

  void toggleSelection(String username) {
    state = [
      for (final competitor in state)
        if (competitor.username == username)
          competitor.copyWith(isSelected: !competitor.isSelected)
        else
          competitor,
    ];
  }

  void addManualCompetitor(String username) {
    final cleanedUsername = username.trim();
    if (cleanedUsername.isEmpty) {
      return;
    }

    state = [
      ...state,
      CompetitorProfile(
        username: cleanedUsername,
        displayName: cleanedUsername,
        followersText: '0 pratilaca',
        category: 'Ručno dodato',
        relevanceLabel: 'Ručno dodato',
        isSelected: true,
      ),
    ];
  }
}
