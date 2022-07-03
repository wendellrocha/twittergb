import 'package:dependencies/dependencies.dart';

import 'access_page.dart';
import 'access_store.dart';
import 'pages/create_account/create_account_page.dart';
import 'pages/create_account/create_account_store.dart';
import 'pages/login/login_page.dart';
import 'pages/login/login_store.dart';

class AccessModule extends Module {
  @override
  final List<Bind> binds = [
    TripleBind.lazySingleton((i) => CreateAccountStore()),
    TripleBind.lazySingleton((i) => LoginStore()),
    TripleBind.lazySingleton((i) => AccessStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const AccessPage()),
    ChildRoute('/login', child: (_, args) => const LoginPage()),
    ChildRoute('/create-account', child: (_, args) => const CreateAccountPage())
  ];
}
