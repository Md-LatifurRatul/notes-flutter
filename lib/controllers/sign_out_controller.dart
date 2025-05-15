import 'dart:developer';

import 'package:get/get.dart';
import 'package:notes_flutter/services/auth_exception.dart';
import 'package:notes_flutter/services/firebase_auth_service.dart';

class SignOutController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;
  final _firebaseAuthService = FirebaseAuthService();

  bool get inProgress => _inProgress;
  String get errorMessage => _errorMessage ?? "Sign-Out Failed Try Again!";
  Future<bool> signOut() async {
    try {
      _inProgress = true;
      update();
      await _firebaseAuthService.signOut();

      return true;
    } on AuthException catch (e) {
      _errorMessage = e.message;
      log("Sign-out failed: ${e.message}");
    } catch (e) {
      _errorMessage = "Something went wrong";
    } finally {
      _inProgress = false;
      update();
    }
    return false;
  }
}
