import 'package:dependencies/dependencies.dart';

import 'home_page.dart';
import 'home_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomePage()),
  ];
}
