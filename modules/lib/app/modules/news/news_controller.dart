import 'news_store.dart';

class NewsController {
  final NewsStore _store;

  NewsController(this._store);

  NewsStore get store => _store;

  void getNews() => _store.getNews();
}
