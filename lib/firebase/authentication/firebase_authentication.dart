import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication{
  static final auth = getFirebaseAuthInstance();

  static FirebaseAuth getFirebaseAuthInstance(){
    // return FirebaseAuth.instance.useAuthEmulator("10.0.2.2", 9099);
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.useAuthEmulator("10.0.2.2", 9099);
    return auth;
  }

  static Future <dynamic> createUserWithEmailAndPassword({required String email, required String password}) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.useAuthEmulator("10.0.2.2", 9099);
    var credential;
    try {
      credential = await  auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }else{
        print(e);
      }
    } catch (e) {
      print(e);
    }

    return credential;
  }

  static Future <dynamic> sendmessage({required String email, required String password}) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.useAuthEmulator("10.0.2.2", 9099);
    var credential;
    try {
      // var listener =
      //     FirebaseDatabase.instance.ref().child("test").onValue.listen((d) {
      //       print(d.snapshot.value);
      //     });
    } on FirebaseAuthException catch (e) {
      print('firebase authe exception :  $e .');
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
      }else{
        print(e);
      }
    }

    return credential;
  }

  void getCurrentUser() async{
    try{
      final User? user = await auth.currentUser;
      if(user != null){
        User loggedInUser = user;
        print('logged In User email is : ${loggedInUser.email}');
      }
    }catch(e){
      print(e);
    }
  }

}