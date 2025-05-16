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

      theme: ThemeData(
        appBarTheme: _appBarTheme(),
        elevatedButtonTheme: _elevatedButtonTheme(),
      ),
    );
  }

  ElevatedButtonThemeData _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  AppBarTheme _appBarTheme() {
    return AppBarTheme(centerTitle: true, backgroundColor: Colors.amber);
  }
}
