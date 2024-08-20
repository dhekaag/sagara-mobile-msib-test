import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheather_forecast_app/app/constant/colors.dart';

class THelperFunctions {
  static Color? getColor(String value) {
    /// Define your product specific colors here and it will match the attribute colors and show specific 🟠🟡🟢🔵🟣🟤

    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else if (value == 'Blue') {
      return Colors.blue;
    } else if (value == 'Pink') {
      return Colors.pink;
    } else if (value == 'Grey') {
      return Colors.grey;
    } else if (value == 'Purple') {
      return Colors.purple;
    } else if (value == 'Black') {
      return Colors.black;
    } else if (value == 'White') {
      return Colors.white;
    } else if (value == 'Yellow') {
      return Colors.yellow;
    } else if (value == 'Orange') {
      return Colors.deepOrange;
    } else if (value == 'Brown') {
      return Colors.brown;
    } else if (value == 'Teal') {
      return Colors.teal;
    } else if (value == 'Indigo') {
      return Colors.indigo;
    } else {
      return null;
    }
  }

  static void showSnackBar(String message, {Duration? duration}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
          content: Text(message,
              style: const TextStyle(fontWeight: FontWeight.w600)),
          duration: duration ?? const Duration(milliseconds: 2000),
          showCloseIcon: true,
          dismissDirection: DismissDirection.up,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(Get.context!).size.height - 100,
            left: 10,
            right: 10,
          )),
    );
  }

  static void showErrorSnackBar(
    String message, {
    Duration? duration,
    int? marginBottom = 150,
  }) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
          content: Text(message,
              style: TextStyle(color: errorColor, fontWeight: FontWeight.w600)),
          duration: duration ?? const Duration(milliseconds: 2000),
          backgroundColor: errorContainerColor,
          showCloseIcon: true,
          closeIconColor: errorColor,
          dismissDirection: DismissDirection.up,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(Get.context!).size.height - marginBottom!,
            left: 10,
            right: 10,
          )),
    );
  }

  static void showSuccessSnackBar(String message, {Duration? duration}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
          content: Text(message,
              style: const TextStyle(fontWeight: FontWeight.w600)),
          backgroundColor: primaryColor,
          duration: duration ?? const Duration(milliseconds: 2000),
          showCloseIcon: true,
          dismissDirection: DismissDirection.up,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(Get.context!).size.height - 150,
            left: 10,
            right: 10,
          )),
    );
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }
}
