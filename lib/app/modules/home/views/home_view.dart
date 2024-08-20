import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:wheather_forecast_app/app/constant/colors.dart';
import 'package:wheather_forecast_app/app/data/models/weather_forecast_model.dart';
import 'package:wheather_forecast_app/app/utils/adaptive_font/adaptive_font.dart';
import 'package:wheather_forecast_app/app/utils/helpers/helper_function.dart';
import '../controllers/home_controller.dart';
import 'widgets/weather_animation_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(secondaryColor),
            ),
          );
        } else if (controller.errorMessage.isNotEmpty) {
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Lottie.asset(
                    'assets/animations/error_animation.json',
                    width: 250,
                    height: 250,
                    repeat: true,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: THelperFunctions.screenWidth() * 0.8,
                  child: Text(
                    controller.errorMessage.value,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: AdaptiveFont.getFontSize(context, 16),
                          color: secondaryColor,
                        ),
                  ),
                ),
              ],
            ),
          );
        }
        return HomeContent(controller: controller);
      }),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: THelperFunctions.screenWidth(),
      height: THelperFunctions.screenHeight(),
      margin: const EdgeInsets.all(16),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding:
                    EdgeInsets.only(top: THelperFunctions.screenHeight() / 16),
                child: Obx(
                  () => Text(
                    controller.cityName.value,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: AdaptiveFont.getFontSize(context, 24),
                          color: secondaryColor,
                        ),
                  ),
                ),
              ),
            ),
            SizedBox(height: THelperFunctions.screenHeight() / 10),
            Center(
              child: Obx(
                () => WeatherAnimationWidget(
                  weatherType: controller.weatherToday.value,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: 20, top: THelperFunctions.screenHeight() / 25),
              child: Row(
                children: [
                  Obx(
                    () => Text(
                      "${controller.temperatureToday.value}°",
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontSize: AdaptiveFont.getFontSize(context, 64),
                                color: secondaryColor,
                              ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    padding: const EdgeInsets.only(top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Obx(
                          () => Text(
                            controller.weatherDetail.value,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize:
                                      AdaptiveFont.getFontSize(context, 14),
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Obx(
                          () => Text(
                            "H: ${controller.maxTemperatureToday.value}° | L: ${controller.minTemperatureToday.value}°",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: THelperFunctions.screenHeight() * 0.25,
              width: THelperFunctions.screenWidth(),
              child: Obx(
                () => CarouselView(
                  backgroundColor: Colors.white,
                  elevation: 3,
                  itemSnapping: true,
                  shrinkExtent: 10,
                  scrollDirection: Axis.horizontal,
                  itemExtent: THelperFunctions.screenWidth() * 0.3,
                  children:
                      controller.weatherForecastForNext3Days.map((weatherData) {
                    DateTime dateTime =
                        DateTime.parse(weatherData?.dtTxt ?? '');
                    String dayName = DateFormat('EEEE').format(dateTime);
                    String hour = DateFormat('Hm').format(dateTime);
                    return WeatherForecastHourlyCard(
                      weatherData: weatherData,
                      dayName: dayName,
                      hour: hour,
                    );
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WeatherForecastHourlyCard extends StatelessWidget {
  const WeatherForecastHourlyCard({
    super.key,
    required this.weatherData,
    this.dayName,
    this.hour,
  });

  final WeatherList? weatherData;
  final String? dayName;
  final String? hour;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      width: THelperFunctions.screenWidth() * 0.3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              dayName ?? "",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              hour ?? "",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            WeatherAnimationWidget(
              weatherType: weatherData?.weather?.first.main,
              height: 80,
              width: 80,
            ),
            Text(
              "${weatherData?.main?.temp?.round()}°",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Expanded(
              child: Text(
                "${weatherData?.weather?.first.description}",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
