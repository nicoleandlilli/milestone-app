import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStore{

  static final firebaseStore = FirebaseFirestore.instance;
  static final auth = FirebaseAuth.instance;

  void getMessages(String collectionPath) async {
    // Future<QuerySnapshot<T>>
    final messages = await firebaseStore.collection(collectionPath).get();
    for(var message in messages.docs){
      print(message.data());
    }
  }


  void getStreamMessages() async {
    await for(var snapshot in firebaseStore.collection('messages').snapshots()){
      for(var message in snapshot.docs){
        print(message.data());
      }
    }
  }
}