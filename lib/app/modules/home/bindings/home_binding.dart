import 'package:get/get.dart';
import 'package:wheather_forecast_app/app/data/services/weather_forecast_service.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.put(WeatherForecastService());
  }
}
