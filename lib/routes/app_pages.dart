import 'package:go_router/go_router.dart';
import 'package:notes_flutter/presentation/pages/authentication/login_screen.dart';
import 'package:notes_flutter/presentation/pages/authentication/sign_up_screen.dart';
import 'package:notes_flutter/presentation/pages/home/notes_flutter_home_screen.dart';
import 'package:notes_flutter/presentation/pages/notes/add_notes_screen.dart';
import 'package:notes_flutter/presentation/pages/splash_screen.dart';
import 'package:notes_flutter/routes/app_routes.dart';

class AppPages {
  static GoRouter routes(String initialRoute) {
    return GoRouter(
      initialLocation: initialRoute,

      routes: [
        GoRoute(
          path: AppRoutes.splash,

          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: AppRoutes.home,

          builder: (context, state) => const NotesFlutterHomeScreen(),
        ),

        GoRoute(
          path: AppRoutes.login,

          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: AppRoutes.signup,

          builder: (context, state) => const SignUpScreen(),
        ),

        GoRoute(
          path: AppRoutes.addnote,

          builder: (context, state) => const AddNotesScreen(),
        ),
      ],
    );
  }
}
