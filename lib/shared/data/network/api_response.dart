import 'package:equatable/equatable.dart';

import 'api_codes.dart';

class ApiResponse<T> extends Equatable {
  const ApiResponse({
    required this.statusCode,
    this.data,
    this.message,
  });
  final T? data;
  final StatusCode statusCode;
  final String? message;

  bool get isSuccess => statusCode == StatusCode.success;

  @override
  List<Object?> get props => [
        data,
        statusCode,
        message,
      ];
}
