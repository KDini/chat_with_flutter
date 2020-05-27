import 'package:firebase_database/firebase_database.dart';

class Message {
  String from;
  String to;
  String text;
  String imageUrl;
  String dateString;

  Message(DataSnapshot snapshot){
    Map value = snapshot.value;
    from = value["from"];
    to = value["to"];
    text = value["text"];
    imageUrl = value["imageUrl"];
    dateString = value["dateString"];
  }
}