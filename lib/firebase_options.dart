// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
show defaultTargetPlatform, kIsWeb, TargetPlatform;

 
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
    apiKey: 'AIzaSyCrkOlryIuTmR8adtdgvgObyAbIhbWnwtg',
    appId: '1:402787004440:web:62340d43caa71c86bf536d',
    messagingSenderId: '402787004440',
    projectId: 'tnpu-fizmat',
    authDomain: 'tnpu-fizmat.firebaseapp.com',
    storageBucket: 'tnpu-fizmat.appspot.com',
    measurementId: 'G-M5NVXQKH2Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAfqdWn0S9z5_gASDY-Le4TtlMaydgMi98',
    appId: '1:402787004440:android:b5486284c2dd6a5ebf536d',
    messagingSenderId: '402787004440',
    projectId: 'tnpu-fizmat',
    storageBucket: 'tnpu-fizmat.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-Pmg1rnRGyOU1ssP3YrBJ7LAwQmIT8ZA',
    appId: '1:402787004440:ios:3e6ba9162ec05c5fbf536d',
    messagingSenderId: '402787004440',
    projectId: 'tnpu-fizmat',
    storageBucket: 'tnpu-fizmat.appspot.com',
    iosBundleId: 'com.example.fizmat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB-Pmg1rnRGyOU1ssP3YrBJ7LAwQmIT8ZA',
    appId: '1:402787004440:ios:7e00ec068b1a05bcbf536d',
    messagingSenderId: '402787004440',
    projectId: 'tnpu-fizmat',
    storageBucket: 'tnpu-fizmat.appspot.com',
    iosBundleId: 'com.example.fizmat.RunnerTests',
  );
}
