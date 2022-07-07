import 'package:dependencies/dependencies.dart';

import 'home_controller.dart';
import 'home_page.dart';
import 'home_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    TripleBind.lazySingleton((i) => HomeStore(i())),
    Bind.lazySingleton((i) => HomeController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomePage()),
  ];
}
