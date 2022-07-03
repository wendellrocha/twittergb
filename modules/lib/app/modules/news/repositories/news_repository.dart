import 'package:common/common.dart';

class NewsRepository {
  final IHttpClientAdapter _client;

  NewsRepository(this._client);

  Future<News> fetchNews(String url) async {
    final response = await _client.get(url);

    return response.fold((l) => throw l, (response) {
      News items = [];
      for (var json in response.data['news']) {
        items.add(NewsModel.fromJson(json));
      }

      return items;
    });
  }
}
