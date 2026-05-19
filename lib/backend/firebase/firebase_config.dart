import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCqOGl7WzLIDgwx9esiwY2BASvYxUb4QAo",
            authDomain: "quiz-app-0t16nf.firebaseapp.com",
            projectId: "quiz-app-0t16nf",
            storageBucket: "quiz-app-0t16nf.appspot.com",
            messagingSenderId: "71091116829",
            appId: "1:71091116829:web:ad1159279f5a17af3cdff4"));
  } else {
    await Firebase.initializeApp();
  }
}
