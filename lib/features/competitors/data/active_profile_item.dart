class ActiveProfileItem {
  const ActiveProfileItem({
    required this.username,
    required this.activitySummary,
    required this.relevanceBadge,
    required this.suggestedAction,
  });

  final String username;
  final String activitySummary;
  final String relevanceBadge;
  final String suggestedAction;
}
