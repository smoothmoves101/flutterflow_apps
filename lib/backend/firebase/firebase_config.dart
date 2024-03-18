import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAr7Yb_8ibTw0jRibSF09JpgZi3FjU9K38",
            authDomain: "prayer-daily-y94ga1.firebaseapp.com",
            projectId: "prayer-daily-y94ga1",
            storageBucket: "prayer-daily-y94ga1.appspot.com",
            messagingSenderId: "100117886911",
            appId: "1:100117886911:web:7dd14c7bbd0c89a867530a"));
  } else {
    await Firebase.initializeApp();
  }
}
