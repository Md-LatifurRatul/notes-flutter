import 'package:get/route_manager.dart';
import 'package:notes_flutter/presentation/pages/splash_screen.dart';
import 'package:notes_flutter/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
  ];
}
