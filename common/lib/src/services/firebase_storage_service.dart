import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dependencies/dependencies.dart';

import '../errors/storage_error.dart';

const String _destination = 'files/';

class FirebaseStorageService {
  final FirebaseStorage _storage;

  FirebaseStorageService(this._storage);

  Future<Either<StorageError, String>> uploadFile({
    required File file,
    required String userId,
    required String type,
  }) async {
    try {
      final reference = _storage.ref(_destination).child('${userId}_$type');

      final upload = await reference.putFile(file);

      final url = await upload.ref.getDownloadURL();

      return Right(url);
    } on FirebaseException catch (e) {
      return Left(StorageError.fromCode(e.code));
    }
  }
}
