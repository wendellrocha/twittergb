import 'package:dartz/dartz.dart';

import '../http/errors/http_error.dart';
import '../http/response/http_response.dart';

abstract class IHttpClientAdapter {
  Future<Either<HttpError, HttpResponse>> get(
    String url, {
    Map<String, String>? queryParams,
    Map<String, String>? headers,
  });

  Future<Either<HttpError, HttpResponse>> post(
    String url,
    dynamic data, {
    Map<String, String>? queryParams,
    Map<String, String>? headers,
  });

  Future<Either<HttpError, HttpResponse>> put(
    String url,
    dynamic data, {
    Map<String, String>? queryParams,
    Map<String, String>? headers,
  });

  Future<Either<HttpError, HttpResponse>> delete(
    String url, {
    Map<String, String>? queryParams,
    Map<String, String>? headers,
  });
}
