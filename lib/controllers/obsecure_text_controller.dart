import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ObsecureTextController extends GetxController {
  final RxBool isObsecured = true.obs;

  void toogleObsecure() {
    isObsecured.value = !isObsecured.value;
  }

  Icon get icon =>
      isObsecured.value
          ? const Icon(Icons.visibility_outlined)
          : const Icon(Icons.visibility_off_outlined);
}
