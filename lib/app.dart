import 'package:flutter/material.dart';
import 'package:notes_flutter/controller_binder.dart';
import 'package:notes_flutter/routes/app_pages.dart';
import 'package:notes_flutter/routes/app_routes.dart';
import 'package:notes_flutter/services/firebase_auth_service.dart';

class NotesFlutterApp extends StatelessWidget {
  const NotesFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final initialRoute =
        FirebaseAuthService().currentUser == null
            ? AppRoutes.splash
            : AppRoutes.home;

    ControllerBinder().dependencies();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Notes App",
      routerConfig: AppPages.routes(initialRoute),
    );
  }
}
