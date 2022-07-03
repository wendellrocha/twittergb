import 'package:dependencies/dependencies.dart';

import 'splash_page.dart';
import 'splash_store.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    TripleBind.lazySingleton((i) => SplashStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SplashPage()),
  ];
}
