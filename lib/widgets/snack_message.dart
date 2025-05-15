import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackType { success, error }

class SnackMessage {
  static void shownackMessage({
    required String message,
    required SnackType type,
  }) {
    Get.snackbar(
      type == SnackType.success ? "Success" : "Error",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: type == SnackType.success ? Colors.green : Colors.red,
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
      borderRadius: 8,
      duration: const Duration(seconds: 3),
      icon: Icon(
        type == SnackType.success ? Icons.check_circle : Icons.error,
        color: Colors.white,
      ),
    );
  }
}
