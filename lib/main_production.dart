import 'package:challenge_swiss/bootstrap.dart';
import 'package:challenge_swiss/core/app/app.dart';
import 'package:challenge_swiss/shared/data/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  Hive
    ..init((await getApplicationDocumentsDirectory()).path)
    ..registerAdapter(MovieModelAdapter());

  bootstrap(() => const App());
}
