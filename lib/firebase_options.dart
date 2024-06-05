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
    apiKey: 'AIzaSyAzyanQZwURUAEdpsOS6GQ68jJJV4Kt5gA',
    appId: '1:961076960149:web:e79659dc272059c8bff49c',
    messagingSenderId: '961076960149',
    projectId: 'maintestproject-21ee6',
    authDomain: 'maintestproject-21ee6.firebaseapp.com',
    storageBucket: 'maintestproject-21ee6.appspot.com',
    measurementId: 'G-QLJYYGTE2E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBRseiSDw2jBDUn5nXKJUngarpiWzXHwJk',
    appId: '1:961076960149:android:5e43987ad0dc17e3bff49c',
    messagingSenderId: '961076960149',
    projectId: 'maintestproject-21ee6',
    storageBucket: 'maintestproject-21ee6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB4B3vvTjRVgZ3TM5pqN6ilBaNx7BMLXfc',
    appId: '1:961076960149:ios:b72f0ea109d6c068bff49c',
    messagingSenderId: '961076960149',
    projectId: 'maintestproject-21ee6',
    storageBucket: 'maintestproject-21ee6.appspot.com',
    iosBundleId: 'com.example.maintestproject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB4B3vvTjRVgZ3TM5pqN6ilBaNx7BMLXfc',
    appId: '1:961076960149:ios:b72f0ea109d6c068bff49c',
    messagingSenderId: '961076960149',
    projectId: 'maintestproject-21ee6',
    storageBucket: 'maintestproject-21ee6.appspot.com',
    iosBundleId: 'com.example.maintestproject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAzyanQZwURUAEdpsOS6GQ68jJJV4Kt5gA',
    appId: '1:961076960149:web:fd31b4b3c2b140b6bff49c',
    messagingSenderId: '961076960149',
    projectId: 'maintestproject-21ee6',
    authDomain: 'maintestproject-21ee6.firebaseapp.com',
    storageBucket: 'maintestproject-21ee6.appspot.com',
    measurementId: 'G-8N4TJLN8CH',
  );
}
