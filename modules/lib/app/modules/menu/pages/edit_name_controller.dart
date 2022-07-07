import 'package:common/common.dart';

class EditNameController {
  final UserStore _userStore;
  final FirebaseAuthService _authService;

  EditNameController(this._userStore, this._authService);

  Future<void> updateUsername(String name) async {
    await _authService.updateUsername(name);
    final updatedUser = _userStore.user;
    _userStore.user = updatedUser!.copyWith(name: name);
  }
}
