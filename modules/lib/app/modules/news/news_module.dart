import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';

import 'news_controller.dart';
import 'news_page.dart';
import 'news_store.dart';
import 'repositories/news_repository.dart';

class NewsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => NewsRepository(i<IHttpClientAdapter>())),
    TripleBind.lazySingleton((i) => NewsStore(i())),
    Bind.lazySingleton((i) => NewsController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const NewsPage()),
  ];
}
