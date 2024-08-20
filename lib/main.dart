import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:wheather_forecast_app/app/constant/colors.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/theme/app_theme.dart';

Future<void> main() async {
  await dotenv.load();
  _setUpEdgeToEdge();
  runApp(const WeatheForecastApp());
}

class WeatheForecastApp extends StatelessWidget {
  const WeatheForecastApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppTheme.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}

_setUpEdgeToEdge() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: backgroundColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}
