import 'package:dependencies/dependencies.dart';

import 'access_controller.dart';
import 'access_page.dart';
import 'access_store.dart';
import 'pages/create_account/create_account_controller.dart';
import 'pages/create_account/create_account_page.dart';
import 'pages/create_account/create_account_store.dart';
import 'pages/login/login_controller.dart';
import 'pages/login/login_page.dart';
import 'pages/login/login_store.dart';

class AccessModule extends Module {
  @override
  final List<Bind> binds = [
    TripleBind.lazySingleton((i) => CreateAccountStore(i())),
    TripleBind.lazySingleton((i) => LoginStore(i())),
    TripleBind.lazySingleton((i) => AccessStore(i())),
    Bind.lazySingleton((i) => AccessController(i())),
    Bind.lazySingleton((i) => CreateAccountController(i(), i())),
    Bind.lazySingleton((i) => LoginController(i(), i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const AccessPage()),
    ChildRoute(
      '/login/:email',
      child: (_, args) => LoginPage(
        email: args.params['email'],
      ),
    ),
    ChildRoute(
      '/create-account/:email',
      child: (_, args) => CreateAccountPage(
        email: args.params['email'],
      ),
    ),
  ];
}
