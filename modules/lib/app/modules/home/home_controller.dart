import 'home_store.dart';

class HomeController {
  final HomeStore _store;

  HomeController(this._store);

  HomeStore get store => _store;

  void getAllPostsStream() => _store.getAllPostsStream();

  void deletePost(String id) => _store.deletePost(id);
}
