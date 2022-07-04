import 'package:dependencies/dependencies.dart';

import '../errors/auth_error.dart';
import '../models/user_model.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth;

  FirebaseAuthService(this._auth);

  void _listenChanges() {
    final stream = _auth.userChanges();

    stream.listen((User? user) {
      if (user != null) {
        print(user);
      }
    });
  }

  Future<UserModel> createAccount(UserModel user) async {
    try {
      final firebaseUser = await _auth.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      return user.copyWith(userId: firebaseUser.user!.uid);
    } on FirebaseAuthException catch (e) {
      throw CreateUserError.fromCode(e.code);
    }
  }

  Future<UserModel> login(UserModel user) async {
    try {
      final firebaseUser = await _auth.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      return user.copyWith(userId: firebaseUser.user!.uid);
    } on FirebaseAuthException catch (e) {
      throw LoginUserError.fromCode(e.code);
    }
  }

  Future<void> updateUsername(String name) async {
    if (_auth.currentUser == null) return;
    await _auth.currentUser!.updateDisplayName(name);
  }

  Future<void> updateProfileAvatar(String url) async {
    if (_auth.currentUser == null) return;
    await _auth.currentUser!.updatePhotoURL(url);
  }
}
