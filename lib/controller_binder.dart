import 'package:get/get.dart';
import 'package:notes_flutter/controllers/obsecure_text_controller.dart';
import 'package:notes_flutter/controllers/sign_in_controller.dart';
import 'package:notes_flutter/controllers/sign_up_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ObsecureTextController());
    Get.lazyPut(() => SignInController());
    Get.lazyPut(() => SignUpController());
    Get.lazyPut(() => SignUpController());
  }
}
