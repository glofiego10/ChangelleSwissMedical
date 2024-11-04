import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String apiKey = dotenv.env['apiKey']!;
  static String baseUrl = dotenv.env['baseUrl']!;
}
