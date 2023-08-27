class WordWord {
  String id;
  String source;
  String translate;

  WordWord(
      {required this.id,
      required this.source,
      required this.translate});

  factory WordWord.fromJson(Map<String, dynamic> json) {
    return WordWord(
      id: json['id'] ?? '',
      source: json['source'] ?? '',
      translate: json['translate'] ?? '',
    );
  }
}
