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
    apiKey: 'AIzaSyD9HJTpB8RU0EhPOM1WQe6qIrvj4jkdPq4',
    appId: '1:1075882018835:web:9c8d51405f47ae75c0d7e6',
    messagingSenderId: '1075882018835',
    projectId: 'inway-4539f',
    authDomain: 'inway-4539f.firebaseapp.com',
    databaseURL: 'https://inway-4539f-default-rtdb.firebaseio.com',
    storageBucket: 'inway-4539f.appspot.com',
    measurementId: 'G-VWZ7E9R0X0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBD-uNTkoMzPMffHcrg7H8Vv_Q_s5yKs_4',
    appId: '1:1075882018835:android:5666c83457b8c96fc0d7e6',
    messagingSenderId: '1075882018835',
    projectId: 'inway-4539f',
    databaseURL: 'https://inway-4539f-default-rtdb.firebaseio.com',
    storageBucket: 'inway-4539f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC5l5MxzAvBkhlgXdoLQZIO7DRkcmMemV4',
    appId: '1:1075882018835:ios:3ed5d40c17d7bfcac0d7e6',
    messagingSenderId: '1075882018835',
    projectId: 'inway-4539f',
    databaseURL: 'https://inway-4539f-default-rtdb.firebaseio.com',
    storageBucket: 'inway-4539f.appspot.com',
    androidClientId: '1075882018835-0a8j23adqr12rk9b6891emidnfrku11n.apps.googleusercontent.com',
    iosClientId: '1075882018835-q601dcd6t7e6ehu0bv70sol06letlhn4.apps.googleusercontent.com',
    iosBundleId: 'com.example.inway',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC5l5MxzAvBkhlgXdoLQZIO7DRkcmMemV4',
    appId: '1:1075882018835:ios:3ed5d40c17d7bfcac0d7e6',
    messagingSenderId: '1075882018835',
    projectId: 'inway-4539f',
    databaseURL: 'https://inway-4539f-default-rtdb.firebaseio.com',
    storageBucket: 'inway-4539f.appspot.com',
    androidClientId: '1075882018835-0a8j23adqr12rk9b6891emidnfrku11n.apps.googleusercontent.com',
    iosClientId: '1075882018835-q601dcd6t7e6ehu0bv70sol06letlhn4.apps.googleusercontent.com',
    iosBundleId: 'com.example.inway',
  );
}
