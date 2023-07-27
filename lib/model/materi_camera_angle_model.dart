class MateriCameraAngleModel {
  final String title;
  final String materi;
  final List<String> images;
  final DateTime? createdAt;

  MateriCameraAngleModel({
    required this.title,
    required this.materi,
    required this.images,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'materi': materi,
      'images': images,
      'createdAt': DateTime.now(),
    };
  }

  factory MateriCameraAngleModel.fromMap(Map<String, dynamic> map) {
    return MateriCameraAngleModel(
      title: map['title'] ?? '',
      materi: map['materi'] ?? '',
      images: List<String>.from(map['images']),
      createdAt: DateTime.fromMillisecondsSinceEpoch(
          map['createdAt'].millisecondsSinceEpoch),
    );
  }
}
