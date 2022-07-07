import 'package:dartz/dartz.dart';
import 'package:dependencies/dependencies.dart';

import '../errors/firestore_error.dart';
import '../models/post/post_model.dart';
import '../utils/utils.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore _firestore;

  FirebaseFirestoreService(this._firestore);

  Future<Either<FirestoreError, bool>> addPost(PostModel post) async {
    try {
      await _firestore.collection('posts').add(post.toJson());
      return const Right(true);
    } on FirebaseException catch (e) {
      return Left(FirestoreError(errorCode: e.code, message: e.message!));
    }
  }

  Future<Either<FirestoreError, bool>> updatePost(PostModel updatedPost) async {
    try {
      updatedPost.toJson().log();
      await _firestore
          .collection('posts')
          .doc(updatedPost.id)
          .update(updatedPost.toJson());
      return const Right(true);
    } on FirebaseException catch (e) {
      return Left(FirestoreError(errorCode: e.code, message: e.message!));
    }
  }

  Future<Either<FirestoreError, bool>> deletePost(String id) async {
    try {
      await _firestore.collection('posts').doc(id).delete();
      return const Right(true);
    } on FirebaseException catch (e) {
      return Left(FirestoreError(errorCode: e.code, message: e.message!));
    }
  }

  Future<Either<FirestoreError, Stream<QuerySnapshot<Map<String, dynamic>>>>>
      getAllPostsStream() async {
    try {
      final firebasePosts = _firestore
          .collection('posts')
          .orderBy('edited_at', descending: true)
          .snapshots();

      return Right(firebasePosts);
    } on FirebaseException catch (e) {
      return Left(
        FirestoreError(
          errorCode: e.code,
          message: 'Não foi possível pegar os posts no'
              ' moemento. Por favor, tente novamente.',
        ),
      );
    }
  }
}
