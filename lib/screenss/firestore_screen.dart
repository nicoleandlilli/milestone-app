import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/firebase/firestore/fire_store.dart';

import '../firebase/components/round_botton.dart';

final messageTextController = TextEditingController();


class FireStoreScreen extends StatefulWidget {
  static const String id = 'chat_screen';

  const FireStoreScreen({super.key});

  @override
  FireStoreScreenState createState() => FireStoreScreenState();
}

class FireStoreScreenState extends State<FireStoreScreen> {
  @override
  void initState() {
    super.initState();
  }
  int i = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
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
                    onPressed: () {
                      print("clicked add user");
                      FireStore.addUser(i++);
                    }),
                // RoundedButton(
                //     title: 'Get User',
                //     color: Colors.lightBlueAccent,
                //     onPressed: () {
                //       print("clicked get user");
                //       FireStore.getUser();
                //     }),
                const MessageStream(),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class MessageStream extends StatelessWidget {
  const MessageStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FireStore.getUserSnapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }

        if (snapshot.hasData) {
          List<MessageBubble> messageBubbles = [];

          if (snapshot.data != null) {
            // // List<QueryDocumentSnapshot<T>>
            List<DocumentSnapshot> documents = snapshot.data!.docs;
            // documents.reversed;
            print('documents..........$documents');
            for (var document in documents) {
              final name = document['name'];
              final hobby = document['hobby'];
              final age = document['age'];
              print('name..........$name');
              print('hobby..........$hobby');
              print('age..........$age');

              // print('timeStamp..........$timeStamp');
              print('document..........${document.data()}');


              final messageBubble = MessageBubble(
                name: name,
                hobby: hobby,
                age: age,
              );

              messageBubbles.add(messageBubble);
              print('messageBubbles.length.................. ${messageBubbles.length}');

            }
          }

          return Expanded(

              child: ListView(
            // reverse: true,
            children: messageBubbles,
          ));
        } else {
          print('snapshot.has no Data.................. ');
          List<Text> messageWidgets = [];
          messageWidgets.add(Text(
            'No Data',
            style: TextStyle(color: Colors.black),
          ));

          return Column(
            children: messageWidgets,
          );
        }
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble(
      {super.key,
       required this.name, required this.hobby, required this.age});

  final String name;
  final String hobby;
  final String age;

  @override
  Widget build(BuildContext context) {
    print("MessageBubble :$name, $age,$hobby");
    return Padding(
      padding: const EdgeInsets.all(10.0),

      child: Card(
        color: Colors.blueGrey,
        child: Row(

          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 15.0,
                  color:  Colors.black,
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Text(
                hobby,
                style: const TextStyle(
                  fontSize: 15.0,
                  color:  Colors.black,
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Text(
                "$age",
                style: const TextStyle(
                  fontSize: 15.0,
                  color:  Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
