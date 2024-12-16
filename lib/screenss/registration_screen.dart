
import 'package:flutter/material.dart';
import 'package:untitled1/screenss/login_screen.dart';

import '../firebase/authentication/firebase_authentication.dart';
import '../firebase/components/round_botton.dart';
import '../firebase/constants/constants.dart';
import 'firestore_screen.dart';


class RegistrationScreen extends StatefulWidget{

  static const String  id = 'registration_screen';

  const RegistrationScreen({super.key});

  @override
  RegistrationScreenState createState() => RegistrationScreenState();

}

class RegistrationScreenState extends State<RegistrationScreen>{

  late String email;
  late String password;

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
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
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
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your password'),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                    title: 'Register',
                    color: Colors.lightBlueAccent,
                    onPressed: ()  {
                      print("press button");
                      final newUser = FirebaseAuthentication.createUserWithEmailAndPassword(
                          email: email, password: password);
                      print(newUser);
                      if(newUser!=null){
                        Navigator.pushNamed(context, LoginScreen.id);
                        // Navigator.pushNamed(context, FireStoreScreen.id);
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