class HttpRequestException implements Exception {
  HttpRequestException(this.message);
  final String? message;

  @override
  String toString() {
    return message ?? '';
  }
}
