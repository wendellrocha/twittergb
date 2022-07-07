import 'failure.dart';

class FirestoreError extends Failure {
  @override
  final String message;
  final String errorCode;

  FirestoreError({required this.errorCode, required this.message});
}
