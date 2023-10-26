// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAVMl-4J4EhAOm2ZV8E8BGlqhxeIfBeqxI',
    appId: '1:530114298352:web:99cd4e8d6f6861694fdd35',
    messagingSenderId: '530114298352',
    projectId: 'fluttercrud-97a87',
    authDomain: 'fluttercrud-97a87.firebaseapp.com',
    storageBucket: 'fluttercrud-97a87.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA6IEIq5bT1S0-mwsFKlQTjmDUVAkmQPIo',
    appId: '1:530114298352:android:08cb28ef64a082844fdd35',
    messagingSenderId: '530114298352',
    projectId: 'fluttercrud-97a87',
    storageBucket: 'fluttercrud-97a87.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAwF9yJiEHYn1gPuvwoVEzLBzrs_6IjZwU',
    appId: '1:530114298352:ios:7c78f24b06b085524fdd35',
    messagingSenderId: '530114298352',
    projectId: 'fluttercrud-97a87',
    storageBucket: 'fluttercrud-97a87.appspot.com',
    iosBundleId: 'com.example.toDoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAwF9yJiEHYn1gPuvwoVEzLBzrs_6IjZwU',
    appId: '1:530114298352:ios:88e380d37ed4f8d34fdd35',
    messagingSenderId: '530114298352',
    projectId: 'fluttercrud-97a87',
    storageBucket: 'fluttercrud-97a87.appspot.com',
    iosBundleId: 'com.example.toDoApp.RunnerTests',
  );
}