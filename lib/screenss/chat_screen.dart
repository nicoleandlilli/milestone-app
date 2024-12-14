import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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


    return const Text("Chat page");
  }
}
//
// class MessageStream extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       // Stream<QuerySnapshot<T>> snapshots
//       // stream: _firebaseStore.collection('messages').snapshots(),
//       stream: _firebaseStore.collection('messages').orderBy('timestamp',descending: false).snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if(!snapshot.hasData){
//           return Center(
//             child: CircularProgressIndicator(
//               backgroundColor: Colors.lightBlueAccent,
//             ),
//           );
//         }
//
//         if(snapshot.hasData){
//
//           List<MessageBubble> messageBubbles = [];
//
//           if(snapshot.data != null ){
//             // // List<QueryDocumentSnapshot<T>>
//             List<DocumentSnapshot> documents = snapshot.data!.docs;
//             // documents.reversed;
//             print('documents..........$documents');
//             for(var document in documents){
//               final messageMsg = document['msg'];
//               final messageSender = document['sender'];
//               final timeStamp = document['timestamp'];
//               print('msg..........$messageMsg');
//               print('sender..........$messageSender');
//
//               // print('timeStamp..........$timeStamp');
//               print('document..........${document.data()}');
//
//               final currentUser = loggedInUser.email;
//
//               final messageBubble = MessageBubble(
//                 sender: messageSender,
//                 text: messageMsg,
//                 isMe: currentUser==messageSender,
//               );
//
//               messageBubbles.add(messageBubble);
//             }
//           }
//
//           return Expanded(
//               child: ListView(
//                 // reverse: true,
//                 children: messageBubbles,
//               )
//           );
//
//
//         }else{
//           print('snapshot.has no Data.................. ');
//           List<Text> messageWidgets = [];
//           messageWidgets.add(Text('No Data',style: TextStyle(color: Colors.black),));
//           return Column(
//             children: messageWidgets,
//           );
//         }
//       },
//
//     );
//   }
//
// }
//
// class MessageBubble extends StatelessWidget {
//
//   MessageBubble({required this.sender,required this.text, required this.isMe});
//
//   final String sender;
//   final String text;
//   final bool isMe;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.all(10.0),
//
//         child: Column(
//           crossAxisAlignment: isMe? CrossAxisAlignment.start:CrossAxisAlignment.end,
//           children: [
//             Text(
//               sender,
//               style: TextStyle(
//                 fontSize: 12.0,
//                 color: Colors.black54
//               ),
//             ),
//             Material(
//               elevation: 5.0,
//               // borderRadius: BorderRadius.circular(30.0),
//               borderRadius:
//               isMe?
//               BorderRadius.only(
//                 topRight: Radius.circular(30.0),
//                 bottomLeft: Radius.circular(30.0),
//                 bottomRight: Radius.circular(30.0),
//               ):
//               BorderRadius.only(
//                 topLeft: Radius.circular(30.0),
//                 bottomLeft: Radius.circular(30.0),
//                 bottomRight: Radius.circular(30.0),
//               ),
//               color: isMe?Colors.white:Colors.lightBlueAccent,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                 child: Text(
//                   '$text',
//                   style: TextStyle(
//                       fontSize: 15.0,
//                       color: isMe ? Colors.black54 : Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//     );
//
//
//   }
//
// }