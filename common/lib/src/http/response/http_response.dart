class HttpResponse {
  final dynamic data;
  final int? statusCode;

  const HttpResponse({this.data, this.statusCode = 200});

  @override
  String toString() => 'HttpResponse(data: $data, statusCode: $statusCode)';
}
