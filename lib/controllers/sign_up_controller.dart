import 'dart:developer';

import 'package:get/get.dart';
import 'package:notes_flutter/models/auth_user.dart';
import 'package:notes_flutter/services/auth_exception.dart';
import 'package:notes_flutter/services/firebase_auth_service.dart';

class SignUpController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;
  final _firebaseAuthService = FirebaseAuthService();

  bool get inProgress => _inProgress;
  String get errorMessage => _errorMessage ?? "Sign-Up Failed Try Again!";
  Future<bool> singUp(AuthUser user) async {
    try {
      _inProgress = true;
      update();
      final signUpSuccess = await _firebaseAuthService
          .createUserWithEmailAndPassword(user);
      final success = signUpSuccess != null;
      return success;
    } on AuthException catch (e) {
      _errorMessage = e.message;
      log("Creating account failed: ${e.message}");
    } catch (e) {
      _errorMessage = "Something went wrong";
    } finally {
      _inProgress = false;
      update();
    }
    return false;
  }
}
