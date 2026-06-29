class ViralContentItem {
  const ViralContentItem({
    required this.username,
    required this.contentType,
    required this.viewsText,
    required this.likesText,
    required this.commentsText,
    required this.performanceLabel,
    required this.insight,
  });

  final String username;
  final String contentType;
  final String viewsText;
  final String likesText;
  final String commentsText;
  final String performanceLabel;
  final String insight;
}
