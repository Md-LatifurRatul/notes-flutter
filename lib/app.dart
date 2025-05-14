import 'package:flutter/material.dart';
import 'package:notes_flutter/controller_binder.dart';
import 'package:notes_flutter/routes/app_pages.dart';

class NotesFlutterApp extends StatelessWidget {
  const NotesFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerBinder().dependencies();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Notes App",
      routerConfig: AppPages.routes,
    );
  }
}
