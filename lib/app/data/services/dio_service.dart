import 'package:dio/dio.dart';
import 'package:wheather_forecast_app/app/utils/config/config.dart';

class DioInterceptor extends Interceptor {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: Config.openWeatherUrl ?? "https://api.openweathermap.org",
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      responseType: ResponseType.json,
      contentType: "application/json",
    ),
  );
}
