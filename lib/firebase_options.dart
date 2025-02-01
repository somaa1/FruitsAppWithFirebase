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
    apiKey: 'AIzaSyCMBq1E5iloIG-U9mW4Gu9ZFYRr2-3Dojk',
    appId: '1:383198602714:web:24cfc60003ee0a726c0ce3',
    messagingSenderId: '383198602714',
    projectId: 'fruit-app-fcc51',
    authDomain: 'fruit-app-fcc51.firebaseapp.com',
    storageBucket: 'fruit-app-fcc51.firebasestorage.app',
    measurementId: 'G-1E1DGGJFW7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBnNwcdhurrhwwOYRipWvxxW2PpDkdM7zM',
    appId: '1:383198602714:android:908a5b1a1c7fdd336c0ce3',
    messagingSenderId: '383198602714',
    projectId: 'fruit-app-fcc51',
    storageBucket: 'fruit-app-fcc51.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAvkKfbzCLsi6bU9NjlecccdDSSSCHqO9U',
    appId: '1:383198602714:ios:984f7e1a788d83ef6c0ce3',
    messagingSenderId: '383198602714',
    projectId: 'fruit-app-fcc51',
    storageBucket: 'fruit-app-fcc51.firebasestorage.app',
    androidClientId: '383198602714-df30nend727j0hlqrrgfpij0jlnrh06h.apps.googleusercontent.com',
    iosClientId: '383198602714-c1ovuojrvk2ajv7hkathojjh7gudu3c9.apps.googleusercontent.com',
    iosBundleId: 'com.example.fruitsecommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAvkKfbzCLsi6bU9NjlecccdDSSSCHqO9U',
    appId: '1:383198602714:ios:984f7e1a788d83ef6c0ce3',
    messagingSenderId: '383198602714',
    projectId: 'fruit-app-fcc51',
    storageBucket: 'fruit-app-fcc51.firebasestorage.app',
    androidClientId: '383198602714-df30nend727j0hlqrrgfpij0jlnrh06h.apps.googleusercontent.com',
    iosClientId: '383198602714-c1ovuojrvk2ajv7hkathojjh7gudu3c9.apps.googleusercontent.com',
    iosBundleId: 'com.example.fruitsecommerce',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCMBq1E5iloIG-U9mW4Gu9ZFYRr2-3Dojk',
    appId: '1:383198602714:web:c715319d05bca0e16c0ce3',
    messagingSenderId: '383198602714',
    projectId: 'fruit-app-fcc51',
    authDomain: 'fruit-app-fcc51.firebaseapp.com',
    storageBucket: 'fruit-app-fcc51.firebasestorage.app',
    measurementId: 'G-3SWLTZY33Q',
  );
}
