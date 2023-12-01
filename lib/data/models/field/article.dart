class ArticleField {
  String? id;
  DateTime createdAt;
  String title;
  String content;
  String url;
  String? thumbnail;
  ArticleField({
    this.id,
    required this.createdAt,
    required this.title,
    required this.content,
    required this.url,
    this.thumbnail,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createdAt': createdAt.toUtc().millisecondsSinceEpoch,
      'title': title,
      'content': content,
      'url': url,
      'thumbnail': thumbnail,
    };
  }

  factory ArticleField.fromMap(Map<Object?, dynamic> map) {
    return ArticleField(
      id: map['id'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']).toLocal(),
      title: map['title'],
      content: map['content'],
      url: map['url'],
      thumbnail: map['thumbnail'],
    );
  }
}
