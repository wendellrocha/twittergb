abstract class Failure implements Exception {
  String get message;

  @override
  String toString() => message;
}
