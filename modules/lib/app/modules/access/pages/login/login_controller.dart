import 'package:common/common.dart';

import 'login_store.dart';

class LoginController {
  final LoginStore _store;
  final SharedPreferencesService _prefs;
  final UserStore _userStore;

  LoginController(this._store, this._prefs, this._userStore);

  bool get isLoading => _store.isLoading;

  Future<bool> submit(String email, String password) async {
    final result = await _store.submit(email, password);
    if (result.userId != null) {
      _userStore.user = result;
      return true;
    }

    return false;
  }

  Future<String> getRoute() async {
    final route = await _prefs.getObject('route');

    if (route != null) {
      return route['route'];
    }

    return '';
  }

  Future<void> changePassword(String email) async =>
      _store.changePassword(email);
}
