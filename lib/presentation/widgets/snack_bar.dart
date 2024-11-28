import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/app_colors.dart';
import '../res/app_constants.dart';
import '../res/app_routes.dart';

SnackBar buildSnackBar(String winner) {
  String message = winner == AppConstants.D ? "DRAW" : "WINNER IS $winner";

  return SnackBar(
    margin: const EdgeInsets.all(10),
    duration: const Duration(seconds: 3),
    action: SnackBarAction(label: 'Main Menu', onPressed: () => Navigator.pushReplacementNamed(Get.context!, Routes.mainMenu)),
    content: Text(message, style: TextStyle(fontWeight: FontWeight.bold, color: winner == AppConstants.D ? Colors.black : AppColors.primaryColor)),
  );
}
