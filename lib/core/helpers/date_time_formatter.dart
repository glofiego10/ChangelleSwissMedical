import 'package:challenge_swiss/core/extensions/string_extensions.dart';
import 'package:intl/intl.dart';

String formatDate(String date) {
  final dateFormat = DateTime.parse(date);
  return DateFormat.yMMMd('es_AR').format(dateFormat).capitalize();
}
