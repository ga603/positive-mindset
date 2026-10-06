import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCNrKk6bLSrUuMJTXX-AkERChtZkNNqXTs',
    appId: '1:564870108922:web:375eaa2556b7f3a60a1b43',
    messagingSenderId: '564870108922',
    projectId: 'positive-mindset-56159',
    authDomain: 'positive-mindset-56159.firebaseapp.com',
    storageBucket: 'positive-mindset-56159.firebasestorage.app',
  );
}



