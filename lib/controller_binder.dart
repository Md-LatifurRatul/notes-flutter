import 'package:get/get.dart';
import 'package:notes_flutter/controllers/obsecure_text_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ObsecureTextController());
  }
}
