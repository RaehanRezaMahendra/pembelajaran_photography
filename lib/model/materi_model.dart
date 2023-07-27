class MateriModel {
  final String title;
  final String materi;
  final List<String> images;
  final String youtubeUrl;
  final DateTime? createdAt;

  MateriModel({
    required this.title,
    required this.materi,
    required this.images,
    required this.youtubeUrl,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'materi': materi,
      'images': images,
      'youtubeUrl': youtubeUrl,
      'createdAt': DateTime.now(),
    };
  }

  factory MateriModel.fromMap(Map<String, dynamic> map) {
    return MateriModel(
      title: map['title'] ?? '',
      materi: map['materi'] ?? '',
      images: List<String>.from(map['images']),
      youtubeUrl: map['youtubeUrl'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(
          map['createdAt'].millisecondsSinceEpoch),
    );
  }
}
