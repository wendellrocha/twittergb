import 'dart:async';

import 'package:dependencies/dependencies.dart';

import '../services/shared_preferences_service.dart';
import '../stores/user_store.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/access/');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    final SharedPreferencesService prefs = await Modular.getAsync();
    bool isLoggedin = Modular.get<UserStore>().user != null;
    if (!isLoggedin) {
      prefs.setObject('route', {
        'route': path,
        'args': Modular.args.data,
      });
    }

    return isLoggedin;
  }
}
