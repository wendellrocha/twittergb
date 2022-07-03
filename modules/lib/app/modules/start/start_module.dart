import 'package:dependencies/dependencies.dart';

import '../home/home_module.dart';
import '../menu/menu_module.dart';
import '../news/news_module.dart';
import 'start_controller.dart';
import 'start_page.dart';
import 'start_store.dart';

class StartModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => StartStore()),
    Bind.lazySingleton((i) => StartController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const StartPage(),
      transition: TransitionType.fadeIn,
      children: [
        ModuleRoute(
          '/home',
          module: HomeModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          '/news',
          module: NewsModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          '/menu',
          module: MenuModule(),
          transition: TransitionType.fadeIn,
        )
      ],
    ),
  ];
}
