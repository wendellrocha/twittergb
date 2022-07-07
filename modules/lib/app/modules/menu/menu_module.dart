import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';

import 'menu_Page.dart';
import 'menu_controller.dart';
import 'menu_store.dart';
import 'pages/edit_name.dart';
import 'pages/edit_name_controller.dart';

class MenuModule extends Module {
  @override
  final List<Bind> binds = [
    TripleBind.lazySingleton((i) => MenuStore()),
    Bind.lazySingleton((i) => MenuController(i(), i(), i())),
    Bind.lazySingleton((i) => EditNameController(i(), i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const MenuPage()),
    ChildRoute(
      '/edit-name',
      child: (_, args) => const EditNamePage(),
      guards: [AuthGuard()],
    )
  ];
}
