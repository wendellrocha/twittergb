import 'dart:io';

import 'package:asuka/asuka.dart' as asuka;
import 'package:common/common.dart';

class MenuController {
  final UserStore _userStore;
  final FirebaseAuthService _authService;
  final FirebaseStorageService _storageService;

  MenuController(this._userStore, this._authService, this._storageService);

  UserModel? get user => _userStore.user;

  final pw = ProgressWidget(isDismissible: false, text: 'Processando...');

  Future<void> logout() async {
    await _authService.logout();
    _userStore.user = null;
  }

  Future<void> changePassword() async {
    final result = await _authService.changePassword(_userStore.user!.email!);
    return result.fold(
      (l) => asuka.showDialog(
        builder: (context) => WarnModalWidget(
          title: 'Ooops!',
          text: l.message,
        ),
      ),
      (r) => asuka.showDialog(
        builder: (context) => const WarnModalWidget(
          assetImage: 'assets/images/ok.png',
          title: 'Ok!',
          text: 'Foi enviado um link de recuperação'
              ' de senha no seu email cadastrado.',
        ),
      ),
    );
  }

  uploadImage(String path) async {
    pw.show();
    final result = await _storageService.uploadFile(
      file: File(path),
      userId: _userStore.user!.userId!,
      type: 'avatar',
    );
    result.fold(
      (l) {
        pw.hide();
        asuka.showDialog(
          builder: (context) => WarnModalWidget(
            title: 'Ooops!',
            text: l.message,
          ),
        );
      },
      (url) {
        pw.hide();
        final updatedUser = _userStore.user!.copyWith(profilePicture: url);
        _authService.updateProfileAvatar(url);
        _userStore.user = updatedUser;
      },
    );
  }
}
