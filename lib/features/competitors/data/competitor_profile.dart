class CompetitorProfile {
  const CompetitorProfile({
    required this.username,
    required this.displayName,
    required this.followersText,
    required this.category,
    required this.relevanceLabel,
    required this.isSelected,
  });

  final String username;
  final String displayName;
  final String followersText;
  final String category;
  final String relevanceLabel;
  final bool isSelected;

  CompetitorProfile copyWith({
    String? username,
    String? displayName,
    String? followersText,
    String? category,
    String? relevanceLabel,
    bool? isSelected,
  }) {
    return CompetitorProfile(
      username: username ?? this.username,
      displayName: displayName ?? this.displayName,
      followersText: followersText ?? this.followersText,
      category: category ?? this.category,
      relevanceLabel: relevanceLabel ?? this.relevanceLabel,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
