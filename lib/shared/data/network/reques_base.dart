import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'api_codes.dart';
import 'api_response.dart';
import 'utf_convert.dart';

typedef ApiUrl = Future<http.Response> Function();
typedef Mapping<T> = T Function(Map<String, dynamic> data);

class RequestBase {
  final _logger = Logger();

  Future<ApiResponse<T>> call<T>({
    required ApiUrl functionUrl,
    required Mapping<T> mapping,
  }) async {
    StatusCode statusCode;

    try {
      final resp = await functionUrl();
      statusCode = getStatus(resp.statusCode);

      if (statusCode != StatusCode.success) {
        _logger
          ..e('Request: ${resp.request?.method} ${resp.request?.url}')
          ..e('Header: ${resp.request?.headers.entries.map((entry) => '${entry.key}: ${entry.value}').join('\n')}');

        throw HttpException('Request failed with status: ${resp.statusCode}');
      }

      final responseData = decodeJsonResponse(resp.bodyBytes);

      T? data;

      try {
        Logger().i(responseData);
        data = mapping(responseData);
      } catch (error) {
        _logger.e('Request: ${error.toString()}');
        rethrow;
      }

      if (statusCode == StatusCode.success) {
        return ApiResponse(
          data: data,
          statusCode: statusCode,
        );
      }

      return ApiResponse(statusCode: statusCode);
    } catch (error) {
      _logger.e('Request: ${error.toString()}');
      return ApiResponse(
        message: error.toString(),
        statusCode: StatusCode.unknown,
      );
    }
  }
}
