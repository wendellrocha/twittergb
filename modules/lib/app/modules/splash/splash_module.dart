import 'package:dependencies/dependencies.dart';

import 'splash_page.dart';
import 'splash_store.dart';

late final String _splashIcon;

class SplashModule extends Module {
  SplashModule({required String splashIcon}) {
    _splashIcon = splashIcon;
  }

  @override
  final List<Bind> binds = [
    TripleBind.lazySingleton((i) => SplashStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SplashPage(splashIcon: _splashIcon)),
  ];
}
