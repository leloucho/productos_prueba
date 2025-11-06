class ServerException implements Exception {
  final String message;
  final int? statusCode;

  const ServerException({
    required this.message,
    this.statusCode,
  });

  @override
  String toString() {
    return 'ServerException: $message (Status Code: $statusCode)';
  }
}