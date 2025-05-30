// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCUSRL-iFB8_kY8hQqJf9zPo_i88VBt298',
    appId: '1:460513572816:web:0f9e637573a8241a3dabd5',
    messagingSenderId: '460513572816',
    projectId: 'flutter-notes-a5f7f',
    authDomain: 'flutter-notes-a5f7f.firebaseapp.com',
    storageBucket: 'flutter-notes-a5f7f.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAjujxt_3972UYXfjvQRqzZheOIOWl-TRQ',
    appId: '1:460513572816:android:dc62e4bef340d61d3dabd5',
    messagingSenderId: '460513572816',
    projectId: 'flutter-notes-a5f7f',
    storageBucket: 'flutter-notes-a5f7f.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBUg8MqFwD6Z42mKCupeFpuFMZ3DPI45T0',
    appId: '1:460513572816:ios:db8f899c002d3d2c3dabd5',
    messagingSenderId: '460513572816',
    projectId: 'flutter-notes-a5f7f',
    storageBucket: 'flutter-notes-a5f7f.firebasestorage.app',
    iosClientId: '460513572816-kak58h85a0pp68beo4btd0saijn0phf0.apps.googleusercontent.com',
    iosBundleId: 'com.example.notesFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBUg8MqFwD6Z42mKCupeFpuFMZ3DPI45T0',
    appId: '1:460513572816:ios:db8f899c002d3d2c3dabd5',
    messagingSenderId: '460513572816',
    projectId: 'flutter-notes-a5f7f',
    storageBucket: 'flutter-notes-a5f7f.firebasestorage.app',
    iosClientId: '460513572816-kak58h85a0pp68beo4btd0saijn0phf0.apps.googleusercontent.com',
    iosBundleId: 'com.example.notesFlutter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCUSRL-iFB8_kY8hQqJf9zPo_i88VBt298',
    appId: '1:460513572816:web:9153b183c631f0e03dabd5',
    messagingSenderId: '460513572816',
    projectId: 'flutter-notes-a5f7f',
    authDomain: 'flutter-notes-a5f7f.firebaseapp.com',
    storageBucket: 'flutter-notes-a5f7f.firebasestorage.app',
  );
}
