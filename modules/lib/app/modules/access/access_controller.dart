import 'access_state.dart';
import 'access_store.dart';

class AccessController {
  final AccessStore _store;

  AccessController(this._store);

  bool get isLoading => _store.isLoading;

  Future<AccessState> submit(String email) => _store.submit(email);
}
