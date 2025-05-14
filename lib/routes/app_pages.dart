import 'package:go_router/go_router.dart';
import 'package:notes_flutter/presentation/pages/authentication/login_screen.dart';
import 'package:notes_flutter/presentation/pages/authentication/sign_up_screen.dart';
import 'package:notes_flutter/presentation/pages/splash_screen.dart';
import 'package:notes_flutter/routes/app_routes.dart';

class AppPages {
  static final GoRouter routes = GoRouter(
    initialLocation: AppRoutes.splash,

    routes: [
      GoRoute(
        path: AppRoutes.splash,

        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: AppRoutes.login,

        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.signup,

        builder: (context, state) => const SignUpScreen(),
      ),
    ],
  );
}
