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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDoVF8FaBeV7AfJ1m0fC-vnOHp9FkLjlEc',
    appId: '1:122240497817:web:60e64666e3129f82886008',
    messagingSenderId: '122240497817',
    projectId: 'fir-app-e6acc',
    authDomain: 'fir-app-e6acc.firebaseapp.com',
    storageBucket: 'fir-app-e6acc.appspot.com',
    measurementId: 'G-MMQWMMT2QT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyArHlVxN0FVcyjCPlIiL9We-S1Jv3_m6gc',
    appId: '1:122240497817:android:17f137a51fd89ca2886008',
    messagingSenderId: '122240497817',
    projectId: 'fir-app-e6acc',
    storageBucket: 'fir-app-e6acc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBFX9URjxn_xVLvQWXhN3m_4epETia2jdg',
    appId: '1:122240497817:ios:f14df4a55e4c0182886008',
    messagingSenderId: '122240497817',
    projectId: 'fir-app-e6acc',
    storageBucket: 'fir-app-e6acc.appspot.com',
    iosClientId: '122240497817-olpvg99okhndbfdjed2lklh1gnj88k2p.apps.googleusercontent.com',
    iosBundleId: 'com.newlinetechnologies.demo-app',
  );
}
