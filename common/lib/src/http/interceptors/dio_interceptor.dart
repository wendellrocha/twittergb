import 'dart:convert';

import 'package:dependencies/dependencies.dart';

import '../errors/http_error.dart';

class DioInterceptor extends Interceptor {
  void onError(DioError err, ErrorInterceptorHandler handler) {
    dynamic data;
    if (err.response?.data is String) {
      data = json.decode(err.response?.data);
    } else {
      data = err.response?.data;
    }

    switch (err.type) {
      case DioErrorType.receiveTimeout:
      case DioErrorType.connectTimeout:
        throw HttpError(
          message: 'O tempo da solicitação esgotou.'
              ' Por favor, verifique a sua conexão com '
              'com a internet e tente novamente.'
              ' ${err.requestOptions.connectTimeout}ms',
          statusCode: 408,
          requestOptions: err.requestOptions,
        );
      case DioErrorType.cancel:
        throw HttpError(
          message: 'A solicitação foi cancelada.'
              ' Por favor, verifique a sua conexão com '
              'com a internet e tente novamente.',
          statusCode: 500,
          requestOptions: err.requestOptions,
        );
      default:
        throw HttpError(
          message: data['message'] ?? data['mensagem'],
          statusCode: err.response?.statusCode,
          requestOptions: err.requestOptions,
        );
    }
  }
}
