import 'package:common/common.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'access_state.dart';

class AccessStore extends NotifierStore<Exception, int> {
  final FirebaseAuthService _authService;

  AccessStore(this._authService) : super(0);

  Future<AccessState> submit(String email) async {
    final result = await _authService.checkIfUserExists(email);
    return result.fold(
      (l) => AccessState(false, true),
      (r) => AccessState(r, true),
    );
  }
}
