// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:wheather_forecast_app/app/modules/home/bindings/home_binding.dart';
import 'package:wheather_forecast_app/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
