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
    apiKey: 'AIzaSyB234pG4P9gMEF-3uEftvYetr95sIsteA4',
    appId: '1:987615672441:web:fd3f14487bb2e92af53ca8',
    messagingSenderId: '987615672441',
    projectId: 'chat-app-b20a4',
    authDomain: 'chat-app-b20a4.firebaseapp.com',
    storageBucket: 'chat-app-b20a4.appspot.com',
    measurementId: 'G-MV82VPKD11',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBjQA5va3xQQyC9uLOGJsbtLXT2wN_X3HY',
    appId: '1:987615672441:android:f3be7a02b4d890fff53ca8',
    messagingSenderId: '987615672441',
    projectId: 'chat-app-b20a4',
    storageBucket: 'chat-app-b20a4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1bHtCOi6JHxELyiDQYrWtwIrXVhFIkJk',
    appId: '1:987615672441:ios:c2dcb627192b0fbdf53ca8',
    messagingSenderId: '987615672441',
    projectId: 'chat-app-b20a4',
    storageBucket: 'chat-app-b20a4.appspot.com',
    iosBundleId: 'com.example.chatApp11',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC1bHtCOi6JHxELyiDQYrWtwIrXVhFIkJk',
    appId: '1:987615672441:ios:c2dcb627192b0fbdf53ca8',
    messagingSenderId: '987615672441',
    projectId: 'chat-app-b20a4',
    storageBucket: 'chat-app-b20a4.appspot.com',
    iosBundleId: 'com.example.chatApp11',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB234pG4P9gMEF-3uEftvYetr95sIsteA4',
    appId: '1:987615672441:web:3ed71b5956abb103f53ca8',
    messagingSenderId: '987615672441',
    projectId: 'chat-app-b20a4',
    authDomain: 'chat-app-b20a4.firebaseapp.com',
    storageBucket: 'chat-app-b20a4.appspot.com',
    measurementId: 'G-SPYX9KLHYJ',
  );
}