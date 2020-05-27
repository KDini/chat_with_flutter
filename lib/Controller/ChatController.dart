import 'package:flutter/material.dart';
import 'package:chatwithflutter/Model/User.dart';

class ChatController extends StatefulWidget {

  String id;
  User partenaire;
  
  ChatController(String id, User partenaire) {
    this.id = id;
    this.partenaire = partenaire;
  }
  
  ChatControllerState createState() => new ChatControllerState();
  

}

class ChatControllerState extends State<ChatController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Text("Salut ${widget.partenaire.prenom} !");
  }
  
}