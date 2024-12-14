import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class FireBase{

  static Future<void> initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

// Ideal time to initialize
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
//...
  }


}