import 'package:common/common.dart';

class AppController {
  final UserStore _userStore;
  final FirebaseAuthService _authService;

  AppController(this._userStore, this._authService);

  void listenUserChanges() {
    _authService.listenChanges((user) {
      if (user != null) {
        _userStore.user = UserModel(
          userId: user.uid,
          name: user.displayName,
          email: user.email,
          profilePicture: user.photoURL,
        );
      }
    });
  }
}
