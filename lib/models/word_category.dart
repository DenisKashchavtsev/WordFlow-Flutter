class WordCategory {
  String name;
  String id;
  String image;
  bool public;

  WordCategory(
      {required this.name,
      required this.id,
      required this.image,
      required this.public});

  factory WordCategory.fromJson(Map<String, dynamic> json) {
    return WordCategory(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      public: json['public'] ?? '',
    );
  }
}
