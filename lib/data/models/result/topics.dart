import '../field/topic.dart';

class TopicsResult {
  List<TopicField> articles;
  TopicsResult({
    required this.articles,
  });

  factory TopicsResult.fromMap(Map<Object?, dynamic> map) {
    var list = map.entries.map<TopicField>((e) {
      var article = TopicField.fromMap(e.value as Map<Object?, dynamic>);
      return article..id = e.key as String;
    }).toList()
      ..sort(((a, b) => b.createdAt.compareTo(a.createdAt))); //! reverse
    return TopicsResult(articles: List.from(list));
  }
}
