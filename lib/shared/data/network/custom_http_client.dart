import 'package:challenge_swiss/core/config/environment.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class CustomHttpClient extends http.BaseClient {
  final http.Client _inner = http.Client();
  final _logger = Logger();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    request.headers['Content-Type'] = 'application/json';
    request.headers['accept'] = 'application/json';
    request.headers['Authorization'] = 'Bearer ${Environment.apiKey}';

    _logRequest(request);
    return _inner.send(request);
  }

  void _logRequest(http.BaseRequest request) {
    _logger
      ..i('Request: ${request.method} ${request.url}')
      ..i('Header: ${request.headers.entries.map((entry) => '${entry.key}: ${entry.value}').join('\n')}');
  }
}
