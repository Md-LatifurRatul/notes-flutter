import 'package:get/get.dart';
import 'package:notes_flutter/controllers/obsecure_text_controller.dart';
import 'package:notes_flutter/controllers/sign_in_controller.dart';
import 'package:notes_flutter/controllers/sign_out_controller.dart';
import 'package:notes_flutter/controllers/sign_up_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(ObsecureTextController());
    Get.put(SignInController());
    Get.put(SignUpController());
    Get.put(SignOutController());
  }
}
