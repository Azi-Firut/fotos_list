class FotoData {
  final String id;
  final String title;
  final String photo;

  const FotoData({
    required this.id,
    required this.title,
    required this.photo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'src': photo,
    };
  }

  factory FotoData.fromMap(Map<String, dynamic> map) {
    return FotoData(
      id: map['id'],
      title: map['title'],
      photo: map['src'],
    );
  }
}
