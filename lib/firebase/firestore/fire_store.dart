import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStore{

  static final db = FirebaseFirestore.instance;
  static final auth = FirebaseAuth.instance;

  static void addUser(int i){
    // Create a new user with a first and last name
    final user = <String, dynamic>{
      "first": "Ada$i",
      "last": "Lovelace",
      "born": 1815+i
    };

// Add a new document with a generated ID
    db.collection("users").add(user).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  static void getUser() async{
    await db.collection("users").get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    });
  }

  void getMessages(String collectionPath) async {
    // Future<QuerySnapshot<T>>
    final messages = await db.collection(collectionPath).get();
    for(var message in messages.docs){
      print(message.data());
    }
  }


  void getStreamMessages() async {
    await for(var snapshot in db.collection('messages').snapshots()){
      for(var message in snapshot.docs){
        print(message.data());
      }
    }
  }
}