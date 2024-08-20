// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class WeatherAnimationWidget extends StatelessWidget {
  String? weatherType;
  double? width = 200;
  double? height = 200;

  WeatherAnimationWidget({
    super.key,
    this.weatherType,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    switch (weatherType) {
      case "Rain" || "Drizzle" || "Thunderstorm":
        return Lottie.asset('assets/animations/rain_animation.json',
            width: width ?? 200, height: height ?? 200, repeat: true);
      case "Snow":
        return Lottie.asset('assets/animations/snow_animation.json',
            width: width ?? 200, height: height ?? 200, repeat: true);
      case "Clouds":
        return Lottie.asset('assets/animations/clouds_animation.json',
            width: width ?? 200, height: height ?? 200, repeat: true);
      case "Clear":
        return Lottie.asset('assets/animations/clear_animation.json',
            width: width ?? 200, height: height ?? 200, repeat: true);
      default:
        return Lottie.asset('assets/animations/clear_animation.json',
            width: width ?? 200, height: height ?? 200, repeat: true);
    }
  }
}
