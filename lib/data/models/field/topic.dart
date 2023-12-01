class TopicField {
  String? id;
  DateTime createdAt;
  String title;
  String content;
  String? url;
  String? thumbnail;
  TopicField({
    this.id,
    required this.createdAt,
    required this.title,
    required this.content,
    this.url,
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

  factory TopicField.fromMap(Map<Object?, dynamic> map) {
    return TopicField(
      id: map['id'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']).toLocal(),
      title: map['title'],
      content: map['content'],
      url: map['url'],
      thumbnail: map['thumbnail'],
    );
  }
}
