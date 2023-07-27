String getThumbnailYoutube(String videoUrl) {
  final videoId = _extractVideoId(videoUrl);
  return 'https://img.youtube.com/vi/$videoId/hqdefault.jpg';
}

String _extractVideoId(String videoUrl) {
  final regExp = RegExp(
    r'^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|v=|\?v=)([^#\\?]*).*',
    caseSensitive: false,
    multiLine: false,
  );
  final match = regExp.firstMatch(videoUrl);
  if (match != null && match.groupCount >= 2) {
    return match.group(2)!;
  } else {
    throw 'Tautan YouTube tidak valid: $videoUrl';
  }
}
