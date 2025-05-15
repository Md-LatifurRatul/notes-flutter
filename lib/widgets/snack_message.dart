import 'package:flutter/material.dart';

enum SnackType { success, error }

class SnackMessage {
  static void shownackMessage({
    required BuildContext context,
    required String message,
    required SnackType type,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(duration: Duration(milliseconds: 500), content: Text(message)),
    );
  }
}
