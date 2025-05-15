import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes_flutter/models/auth_user.dart';
import 'package:notes_flutter/services/auth_exception.dart';

enum AuthAction { signIn, signUp }

abstract class AuthBase {
  User? get currentUser;

  Stream<User?> authStateChanges();
  Future<User?> signInWithEmailAndPassword(AuthUser user);
  Future<User?> createUserWithEmailAndPassword(AuthUser user);
  Future<void> signOut();
}

class FirebaseAuthService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  Future<User?> _authWithEmailPassword({
    required String email,
    required String password,
    required AuthAction action,
  }) async {
    try {
      UserCredential? userCredential;

      if (action == AuthAction.signIn) {
        userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      }
      if (action == AuthAction.signUp) {
        userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      }

      return userCredential?.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        throw AuthException(
          message: "The email address is not valid",
          code: e.code,
        );
      } else if (e.code == "user-disabled") {
        throw AuthException(
          message: "This user has been disabled.",
          code: e.code,
        );
      } else if (e.code == 'user-not-found') {
        throw AuthException(
          message: 'No user found for that email.',
          code: e.code,
        );
      } else if (e.code == 'wrong-password') {
        throw AuthException(message: 'Wrong password.', code: e.code);
      } else if (e.code == 'email-already-in-use') {
        throw AuthException(
          message: 'The email address is already in use by another account.',
          code: e.code,
        );
      } else if (e.code == 'weak-password') {
        throw AuthException(message: 'The password is too weak.', code: e.code);
      } else {
        throw AuthException(
          message: 'An unknown error occurred: ${e.message}',
          code: e.code,
        );
      }
    } catch (e) {
      throw AuthException(message: "An error occured", code: e.toString());
    }
  }

  @override
  Future<User?> createUserWithEmailAndPassword(AuthUser user) async {
    return _authWithEmailPassword(
      email: user.email,
      password: user.password,
      action: AuthAction.signUp,
    );
  }

  @override
  Future<User?> signInWithEmailAndPassword(AuthUser user) async {
    return _authWithEmailPassword(
      email: user.email,
      password: user.password,
      action: AuthAction.signIn,
    );
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      log("Error signing out: $e");
      throw AuthException(message: "Failed to sign out", code: e.toString());
    }
  }
}
