import 'package:challenge_swiss/bootstrap.dart';
import 'package:challenge_swiss/core/app/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  bootstrap(() => const App());
}
