import 'package:common/common.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'repositories/news_repository.dart';

class NewsStore extends NotifierStore<HttpError, News> {
  final NewsRepository _repository;

  NewsStore(this._repository) : super(News.empty());

  void getNews() async {
    setLoading(true);
    try {
      final response = await _repository.fetchNews(gbNewsUrl);
      update(response);
    } on HttpError catch (e) {
      setError(e);
    } finally {
      setLoading(false);
    }
  }
}
