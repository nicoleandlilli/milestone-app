import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/firebase/firestore/fire_store.dart';

import '../firebase/components/round_botton.dart';


final messageTextController = TextEditingController();
final _auth = FirebaseAuth.instance;
late User loggedInUser;
late String messageText;

class ChatScreen extends StatefulWidget {

  static const String  id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();

}

class _ChatScreenState extends State<ChatScreen>{

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    int i=0;
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
                RoundedButton(
                    title: 'Add User',
                    color: Colors.lightBlueAccent,
                    onPressed: (){
                      print("clicked add user");
                      FireStore.addUser(i++);

                    }),

                RoundedButton(
                    title: 'Get User',
                    color: Colors.lightBlueAccent,
                    onPressed: (){
                      print("clicked get user");
                      FireStore.getUser();
                    }),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
