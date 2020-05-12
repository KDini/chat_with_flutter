import 'package:flutter/material.dart';

class MessagesController extends StatefulWidget {

  String id;

  MessagesController(String id) {
    this.id = id;
  }

  MessagesControllerState createState() => new MessagesControllerState();
}

class MessagesControllerState extends State<MessagesController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Text("Message"),
    );;
  }

}