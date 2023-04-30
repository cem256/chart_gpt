import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Env {
  static String get fileName => 'env/.env';
  static String get bearer => dotenv.env['BEARER'] ?? 'NOT FOUND';
}
