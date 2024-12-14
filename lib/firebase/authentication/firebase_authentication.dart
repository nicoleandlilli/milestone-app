import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication{
  static final auth = getFirebaseAuthInstance();

  static FirebaseAuth getFirebaseAuthInstance(){
    return FirebaseAuth.instance;
  }

  static Future <dynamic> createUserWithEmailAndPassword({required String email, required String password}) async{
    var credential;
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    return credential;
  }

  static Future <dynamic> signInWithEmailAndPassword({required String email, required String password}) async{
    var credential;
    try {
      credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

    return credential;
  }
}