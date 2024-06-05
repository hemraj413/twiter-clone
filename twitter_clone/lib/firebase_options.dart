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
    apiKey: 'AIzaSyC26L-2qf3kI2xGyUc19U1lUCalBCRRPNI',
    appId: '1:533393715826:web:7ce6fca7b052fe571308eb',
    messagingSenderId: '533393715826',
    projectId: 'netflix-clone-fa965',
    authDomain: 'netflix-clone-fa965.firebaseapp.com',
    storageBucket: 'netflix-clone-fa965.appspot.com',
    measurementId: 'G-QEY9VRKMZ9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA2NWQJtOfPsolY8o1Gul1niTo5Fh8s7B0',
    appId: '1:533393715826:android:f6e26895ad422f311308eb',
    messagingSenderId: '533393715826',
    projectId: 'netflix-clone-fa965',
    storageBucket: 'netflix-clone-fa965.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCc8auMBVkVGuM3qycQ0N7kiJ1PhBUaMss',
    appId: '1:533393715826:ios:7cfa5f7d958743dc1308eb',
    messagingSenderId: '533393715826',
    projectId: 'netflix-clone-fa965',
    storageBucket: 'netflix-clone-fa965.appspot.com',
    iosBundleId: 'com.example.twitterClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCc8auMBVkVGuM3qycQ0N7kiJ1PhBUaMss',
    appId: '1:533393715826:ios:7cfa5f7d958743dc1308eb',
    messagingSenderId: '533393715826',
    projectId: 'netflix-clone-fa965',
    storageBucket: 'netflix-clone-fa965.appspot.com',
    iosBundleId: 'com.example.twitterClone',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC26L-2qf3kI2xGyUc19U1lUCalBCRRPNI',
    appId: '1:533393715826:web:49190dce8409661d1308eb',
    messagingSenderId: '533393715826',
    projectId: 'netflix-clone-fa965',
    authDomain: 'netflix-clone-fa965.firebaseapp.com',
    storageBucket: 'netflix-clone-fa965.appspot.com',
    measurementId: 'G-VXBEXVLFNM',
  );
}
