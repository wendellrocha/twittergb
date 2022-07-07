import 'package:dartz/dartz.dart';
import 'package:dependencies/dependencies.dart';

import '../../common.dart';
import '../errors/failure.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth;

  FirebaseAuthService(this._auth);

  void listenChanges(UserChangesCallback callback) {
    final stream = _auth.userChanges();

    stream.listen(callback);
  }

  Future<Either<CreateUserError, UserModel>> createAccount(
    UserModel user,
  ) async {
    try {
      final firebaseUser = await _auth.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      await updateUsername(user.name!);
      return Right(user.copyWith(userId: firebaseUser.user!.uid));
    } on FirebaseAuthException catch (e) {
      return Left(CreateUserError.fromCode(e.code));
    }
  }

  Future<Either<Failure, bool>> checkIfUserExists(String email) async {
    try {
      final methods = await _auth.fetchSignInMethodsForEmail(email);
      return Right(methods.isNotEmpty);
    } on FirebaseAuthException catch (e) {
      return Left(LoginUserError.fromCode(e.code));
    }
  }

  Future<Either<LoginUserError, UserModel>> login(UserModel user) async {
    try {
      final firebaseUser = await _auth.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      return Right(user.copyWith(
        userId: firebaseUser.user!.uid,
        name: firebaseUser.user!.displayName!,
        profilePicture: firebaseUser.user!.photoURL,
        email: firebaseUser.user!.email,
      ));
    } on FirebaseAuthException catch (e) {
      return Left(LoginUserError.fromCode(e.code));
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<Either<Failure, bool>> changePassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return const Right(true);
    } on FirebaseAuthException catch (e) {
      return Left(ChangePasswordError.fromCode(e.code));
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
