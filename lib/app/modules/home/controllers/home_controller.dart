import 'package:get/get.dart';
import 'package:wheather_forecast_app/app/data/models/weather_forecast_model.dart';
import 'package:wheather_forecast_app/app/data/services/weather_forecast_service.dart';
import 'package:wheather_forecast_app/app/utils/logger/logger.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  @override
  void onInit() async {
    super.onInit();
    await fetchWeatherForecast();
  }

  final RxBool isLoading = true.obs;
  final RxString errorMessage = "".obs;
  var weatherForecast = WeatherForecastModel().obs;
  var weatherForecastForNext3Days = <WeatherList?>[].obs;
  final RxString cityName = "".obs;
  final RxString weatherToday = "".obs;
  final RxString temperatureToday = "".obs;
  final RxString maxTemperatureToday = "".obs;
  final RxString minTemperatureToday = "".obs;
  final RxString weatherDetail = "".obs;

  // Ambil data cuaca hari ini sampai 3 hari kedepan dari API
  Future<WeatherForecastModel?> fetchWeatherForecast() async {
    try {
      WeatherForecastModel? response =
          await WeatherForecastService.instance.fetchWeatherForecast();
      if (response != null) {
        cityName.value = response.city?.name ?? "";
        final weatherTodayData = response.list?.first;
        weatherToday.value = weatherTodayData?.weather?.first.main ?? "";
        weatherDetail.value =
            weatherTodayData?.weather?.first.description ?? "";
        temperatureToday.value =
            weatherTodayData?.main?.temp?.round().toString() ?? "";
        maxTemperatureToday.value =
            weatherTodayData?.main?.tempMax?.round().toString() ?? "";
        minTemperatureToday.value =
            weatherTodayData?.main?.tempMin?.round().toString() ?? "";

        // Filter data untuk 3 hari ke depan
        DateTime now = DateTime.now();
        List<WeatherList?>? filteredList = response.list?.where((item) {
          DateTime forecastDate = DateTime.parse(item?.dtTxt ?? '');
          return forecastDate.isAfter(now) &&
              forecastDate.isBefore(now.add(const Duration(days: 3)));
        }).toList();

        // Simpan hasil filter ke dalam RxList
        weatherForecastForNext3Days.value = filteredList ?? [];

        // Simpan seluruh data cuaca ke dalam weatherForecast
        weatherForecast.value = response;

        isLoading.value = false;
        return response;
      }
    } catch (e) {
      errorMessage.value = e.toString();
      isLoading.value = false;
      logger.e("Error fetching weather forecast data: $e");
    }
    return null;
  }
}
