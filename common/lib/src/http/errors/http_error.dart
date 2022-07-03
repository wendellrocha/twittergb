import 'package:dependencies/dependencies.dart';

class HttpError {
  final dynamic data;
  final int? statusCode;
  final String? message;
  final RequestOptions requestOptions;

  const HttpError({
    this.data,
    this.statusCode = 500,
    this.message,
    required this.requestOptions,
  });

  @override
  String toString() =>
      'HttpError(data: $data, statusCode: $statusCode, message: $message)';
}
