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
    apiKey: 'AIzaSyCl46IZRRK7dY6EwaDqF3uyf43T-zjlg1k',
    appId: '1:417393749148:web:eca686d8a16cf134aad159',
    messagingSenderId: '417393749148',
    projectId: 'aqua-culture-ce03d',
    authDomain: 'aqua-culture-ce03d.firebaseapp.com',
    storageBucket: 'aqua-culture-ce03d.firebasestorage.app',
    measurementId: 'G-VSH5MWFP2T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDlVZ1KomzwZ-dZ0rziyfI6olbmCu4tfK8',
    appId: '1:417393749148:android:62798037efd1646aaad159',
    messagingSenderId: '417393749148',
    projectId: 'aqua-culture-ce03d',
    storageBucket: 'aqua-culture-ce03d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBcOSlVby_gvwrjCF4JQeIxP61FsrJbEcE',
    appId: '1:417393749148:ios:d802345704ea8adeaad159',
    messagingSenderId: '417393749148',
    projectId: 'aqua-culture-ce03d',
    storageBucket: 'aqua-culture-ce03d.firebasestorage.app',
    iosBundleId: 'com.example.aquaculture',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBcOSlVby_gvwrjCF4JQeIxP61FsrJbEcE',
    appId: '1:417393749148:ios:d802345704ea8adeaad159',
    messagingSenderId: '417393749148',
    projectId: 'aqua-culture-ce03d',
    storageBucket: 'aqua-culture-ce03d.firebasestorage.app',
    iosBundleId: 'com.example.aquaculture',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCl46IZRRK7dY6EwaDqF3uyf43T-zjlg1k',
    appId: '1:417393749148:web:696e15e37d33c34faad159',
    messagingSenderId: '417393749148',
    projectId: 'aqua-culture-ce03d',
    authDomain: 'aqua-culture-ce03d.firebaseapp.com',
    storageBucket: 'aqua-culture-ce03d.firebasestorage.app',
    measurementId: 'G-ZCD2BYF8KY',
  );
}
