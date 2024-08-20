import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  // api config
  static final openWeatherUrl = dotenv.env["SERVER_URL"];
  static final apiKey = dotenv.env["API_KEY"];
}
