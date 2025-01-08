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
    apiKey: 'AIzaSyDbZ1I2rtnSvq_8cLOEWBvlEq9TxE1QF-E',
    appId: '1:597712425509:web:feebbd1f5ff9eaeed0a5cc',
    messagingSenderId: '597712425509',
    projectId: 'faith-connect-81d69',
    authDomain: 'faith-connect-81d69.firebaseapp.com',
    storageBucket: 'faith-connect-81d69.firebasestorage.app',
    measurementId: 'G-QZQDWWXQB0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBD9MDcDusMya5vxV-Tkl5d0nESqIfizX4',
    appId: '1:597712425509:android:c0d2d57b5eac8fcad0a5cc',
    messagingSenderId: '597712425509',
    projectId: 'faith-connect-81d69',
    storageBucket: 'faith-connect-81d69.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAdhNzuREfL5GrBVaV2I0Au0B8IGuLpTqA',
    appId: '1:597712425509:ios:b908eafc9db3f7e9d0a5cc',
    messagingSenderId: '597712425509',
    projectId: 'faith-connect-81d69',
    storageBucket: 'faith-connect-81d69.firebasestorage.app',
    iosBundleId: 'com.example.faithConnect',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAdhNzuREfL5GrBVaV2I0Au0B8IGuLpTqA',
    appId: '1:597712425509:ios:b908eafc9db3f7e9d0a5cc',
    messagingSenderId: '597712425509',
    projectId: 'faith-connect-81d69',
    storageBucket: 'faith-connect-81d69.firebasestorage.app',
    iosBundleId: 'com.example.faithConnect',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDbZ1I2rtnSvq_8cLOEWBvlEq9TxE1QF-E',
    appId: '1:597712425509:web:1734e67e1dcc1a92d0a5cc',
    messagingSenderId: '597712425509',
    projectId: 'faith-connect-81d69',
    authDomain: 'faith-connect-81d69.firebaseapp.com',
    storageBucket: 'faith-connect-81d69.firebasestorage.app',
    measurementId: 'G-XHX0PBMKEQ',
  );
}
