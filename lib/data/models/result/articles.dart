import '../field/article.dart';

class ArticlesResult {
  List<ArticleField> articles;
  ArticlesResult({
    required this.articles,
  });

  factory ArticlesResult.fromMap(Map<Object?, dynamic> map) {
    var list = map.entries.map<ArticleField>((e) {
      var article = ArticleField.fromMap(e.value as Map<Object?, dynamic>);
      return article..id = e.key as String;
    }).toList();
    return ArticlesResult(articles: List.from(list));
  }
}
