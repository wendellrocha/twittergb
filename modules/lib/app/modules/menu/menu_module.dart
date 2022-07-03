import 'package:dependencies/dependencies.dart';

import 'menu_Page.dart';
import 'menu_controller.dart';
import 'menu_store.dart';

class MenuModule extends Module {
  @override
  final List<Bind> binds = [
    TripleBind.lazySingleton((i) => MenuStore()),
    Bind.lazySingleton((i) => MenuController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const MenuPage()),
  ];
}
