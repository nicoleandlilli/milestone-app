import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/firebase/firebase.dart';
import 'package:untitled1/screenss/registration_screen.dart';

import '../firebase/authentication/firebase_authentication.dart';
import '../firebase/components/round_botton.dart';
import '../firebase/constants/constants.dart';
import 'firestore_screen.dart';
class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black),
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email'),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black),
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password'),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                    title: 'Login',
                    color: Colors.lightBlueAccent,
                    onPressed: () async {
                      var user = await FirebaseAuthentication.signInWithEmailAndPassword(email: email, password: password);
                      print("user===$user");
                      if(user!=null){
                        // Navigator.pushNamed(context, ChatScreen.id);
                        Navigator.pushNamed(context, RegistrationScreen.id);
                      }else{
                        print("user===null");
                      }

                    }),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
