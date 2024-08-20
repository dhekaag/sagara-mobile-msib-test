import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:wheather_forecast_app/app/data/models/weather_forecast_model.dart';
import 'package:wheather_forecast_app/app/data/services/dio_service.dart';
import 'package:wheather_forecast_app/app/utils/config/config.dart';
import 'package:wheather_forecast_app/app/utils/logger/logger.dart';

class WeatherForecastService extends GetxController {
  static WeatherForecastService get instance => Get.find();

  @override
  void onInit() async {
    super.onInit();
    await fetchWeatherForecast();
  }

  var weatherForecast = [].obs;
  final _dio = DioInterceptor().dio;

  Future<WeatherForecastModel?> fetchWeatherForecast() async {
    const String jakartaCityId = "1642911";
    try {
      final response = await _dio.get(
        "/data/2.5/forecast?id=$jakartaCityId&appid=${Config.apiKey}&units=metric",
        options: Options(
          contentType: "application/json",
          responseType: ResponseType.json,
        ),
      );

      if (response.statusCode == 200) {
        final weatherForecastData = WeatherForecastModel.fromMap(response.data);
        return weatherForecastData;
      }
    } on DioException catch (e) {
      logger.e("Error fetching weather forecast data: $e");
      if (e.type == DioExceptionType.connectionTimeout) {
        logger.e("Connection timeout error");
        throw "Connection timeout error";
      } else if (e.type == DioExceptionType.sendTimeout) {
        logger.e("Send timeout error");
        throw "Send timeout error";
      } else if (e.type == DioExceptionType.receiveTimeout) {
        logger.e("Receive timeout error");
        throw "Receive timeout error";
      } else if (e.type == DioExceptionType.badResponse) {
        switch (e.response?.statusCode) {
          case 401:
            logger.e("Invalid API key. Please check your API key.");
            throw "Invalid API key. Please check your API key, from Open Weather Map.";
          case 404:
            logger.e("City not found. Please check the city ID.");
            throw "City not found. Please check the city ID.";
          case 500:
            logger.e("Server error. Please try again later.");
            throw "Server error. Please try again later.";
          case 503:
            logger.e("Service unavailable. Please check your connection.");
            throw "Service unavailable. Please check your connection.";
          default:
            logger.e("Received invalid status code: ${e.response?.statusCode}");
            throw "Received invalid status code: ${e.response?.statusCode}";
        }
      } else if (e.type == DioExceptionType.cancel) {
        logger.e("Request to API was cancelled.");
        throw "Request to API was cancelled.";
      } else if (e.type == DioExceptionType.connectionError) {
        logger.e("Unexpected error occurred: $e");
        throw "Error Fetching. Please check your connection.";
      } else {
        logger.e("Unexpected error occurred: $e");
        throw "Unexpected error occurred. Please try again.";
      }
    } on Exception catch (e) {
      logger.e("Unexpected error occurred: $e");
      throw "Unexpected error occurred. Please try again.";
    }
    return null;
  }
}
