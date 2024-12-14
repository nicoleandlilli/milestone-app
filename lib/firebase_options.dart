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
    apiKey: 'AIzaSyDKfrSdb0859cpS7uEE4El_1xxVIteFUv8',
    appId: '1:249341098212:web:63a7406e34ed66002714f1',
    messagingSenderId: '249341098212',
    projectId: 'milestone-app-ac5a2',
    authDomain: 'milestone-app-ac5a2.firebaseapp.com',
    storageBucket: 'milestone-app-ac5a2.firebasestorage.app',
    measurementId: 'G-HYGL47TKJ7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD08umHWBDs98AA2oJ1EjgpTr-moX9FgKY',
    appId: '1:249341098212:android:3abfc01a2fd21c772714f1',
    messagingSenderId: '249341098212',
    projectId: 'milestone-app-ac5a2',
    storageBucket: 'milestone-app-ac5a2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDN_zt_gueuGLQhVLk4rWH297WCmp7vWjs',
    appId: '1:249341098212:ios:09e3abdf54d52b802714f1',
    messagingSenderId: '249341098212',
    projectId: 'milestone-app-ac5a2',
    storageBucket: 'milestone-app-ac5a2.firebasestorage.app',
    iosBundleId: 'com.example.untitled1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDN_zt_gueuGLQhVLk4rWH297WCmp7vWjs',
    appId: '1:249341098212:ios:09e3abdf54d52b802714f1',
    messagingSenderId: '249341098212',
    projectId: 'milestone-app-ac5a2',
    storageBucket: 'milestone-app-ac5a2.firebasestorage.app',
    iosBundleId: 'com.example.untitled1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDKfrSdb0859cpS7uEE4El_1xxVIteFUv8',
    appId: '1:249341098212:web:3b9b7eda5c40fe252714f1',
    messagingSenderId: '249341098212',
    projectId: 'milestone-app-ac5a2',
    authDomain: 'milestone-app-ac5a2.firebaseapp.com',
    storageBucket: 'milestone-app-ac5a2.firebasestorage.app',
    measurementId: 'G-RRBJC69X8K',
  );

}