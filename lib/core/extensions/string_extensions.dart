extension StringExtension on String? {
  bool get isNotNullOrEmpty => isNull && this!.isNotEmpty;

  String capitalize() {
    return '${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}';
  }
}

extension NullableObjectExt<T extends Object> on T? {
  /// general nullable checker
  bool get isNull => this == null;
  bool get isNotNull => !isNull;
}
