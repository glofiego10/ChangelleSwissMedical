extension NullableListExt<T> on List<T>? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isNotNullNorEmpty => !isNullOrEmpty;
}
