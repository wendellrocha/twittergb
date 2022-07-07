import 'package:common/common.dart';

import 'create_account_store.dart';
import 'states/create_account_form_state.dart';

class CreateAccountController {
  final CreateAccountStore _store;
  final SharedPreferencesService _prefs;

  CreateAccountController(this._store, this._prefs);

  bool get isLoading => _store.isLoading;

  Future<bool> submit(CreateAccountFormState state) async {
    final user = await _store.submit(state);

    if (user.userId != null) {
      _prefs.setObject('user', user.toJson());
      return true;
    }

    return false;
  }
}
