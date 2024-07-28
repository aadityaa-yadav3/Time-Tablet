import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCPydwGN13NIOspDmyx80SOEoRJDgMQ8Ao",
            authDomain: "tt-firebase-7dfd1.firebaseapp.com",
            projectId: "tt-firebase-7dfd1",
            storageBucket: "tt-firebase-7dfd1.appspot.com",
            messagingSenderId: "971976648036",
            appId: "1:971976648036:web:d0ea1dd12ad842592f0671",
            measurementId: "G-SHJHDER06W"));
  } else {
    await Firebase.initializeApp();
  }
}
