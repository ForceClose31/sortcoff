import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDtcJAoeqBXmxlsZsp048-XnKMDO8XQ70E',
    appId: '1:909574581057:android:c6805e5376cfa0f4b2cfc0',
    messagingSenderId: '909574581057',
    projectId: 'authshortcoff',
    storageBucket: 'authshortcoff.appspot.com',
  );
}
