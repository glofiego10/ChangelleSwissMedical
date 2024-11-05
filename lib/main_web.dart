import 'package:challenge_swiss/bootstrap.dart';
import 'package:challenge_swiss/core/app/app.dart';
import 'package:challenge_swiss/shared/data/models/movie_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  Hive
    ..initFlutter()
    ..registerAdapter(MovieModelAdapter());

  bootstrap(() => const App());
}
