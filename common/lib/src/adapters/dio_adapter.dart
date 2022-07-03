import 'package:dartz/dartz.dart';
import 'package:dependencies/dependencies.dart';

import '../http/errors/http_error.dart';
import '../http/response/http_response.dart';
import 'http_client_adapter.dart';

class DioAdapter extends IHttpClientAdapter {
  final Dio dio;
  final List<Interceptor>? interceptors;

  DioAdapter({required this.dio, this.interceptors}) {
    if (interceptors != null) dio.interceptors.addAll(interceptors!);
  }

  @override
  Future<Either<HttpError, HttpResponse>> delete(
    String url, {
    Map<String, String>? queryParams,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await dio.delete(
        url,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );

      return Right(
        HttpResponse(
          data: response.data,
          statusCode: response.statusCode,
        ),
      );
    } on DioError catch (e) {
      return Left(
        HttpError(
          requestOptions: e.requestOptions,
          data: e.response?.data,
          message: e.message,
          statusCode: e.response?.statusCode,
        ),
      );
    }
  }

  @override
  Future<Either<HttpError, HttpResponse>> get(
    String url, {
    Map<String, String>? queryParams,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await dio.get(
        url,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );

      return Right(
        HttpResponse(
          data: response.data,
          statusCode: response.statusCode,
        ),
      );
    } on DioError catch (e) {
      return Left(
        HttpError(
          requestOptions: e.requestOptions,
          data: e.response?.data,
          message: e.message,
          statusCode: e.response?.statusCode,
        ),
      );
    }
  }

  @override
  Future<Either<HttpError, HttpResponse>> post(
    String url,
    data, {
    Map<String, String>? queryParams,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await dio.post(
        url,
        data: data,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );

      return Right(
        HttpResponse(
          data: response.data,
          statusCode: response.statusCode,
        ),
      );
    } on DioError catch (e) {
      return Left(
        HttpError(
          requestOptions: e.requestOptions,
          data: e.response?.data,
          message: e.message,
          statusCode: e.response?.statusCode,
        ),
      );
    }
  }

  @override
  Future<Either<HttpError, HttpResponse>> put(
    String url,
    data, {
    Map<String, String>? queryParams,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await dio.put(
        url,
        data: data,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );

      return Right(
        HttpResponse(
          data: response.data,
          statusCode: response.statusCode,
        ),
      );
    } on DioError catch (e) {
      return Left(
        HttpError(
          requestOptions: e.requestOptions,
          data: e.response?.data,
          message: e.message,
          statusCode: e.response?.statusCode,
        ),
      );
    }
  }
}
