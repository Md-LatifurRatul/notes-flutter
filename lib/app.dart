import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:notes_flutter/controller_binder.dart';

class NotesFlutterApp extends StatelessWidget {
  const NotesFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(initialBinding: ControllerBinder());
  }
}
