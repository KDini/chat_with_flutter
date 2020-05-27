import 'package:flutter/material.dart';
import 'package:chatwithflutter/Model/User.dart';
import 'package:chatwithflutter/Widgets/CustomImage.dart';
import 'package:chatwithflutter/Widgets/ZoneDeTexteWidget.dart';

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
    return new Scaffold(
      appBar: new AppBar(title: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new CustomImage(widget.partenaire.imageUrl, widget.partenaire.initiales, 15.0),
          new Text(widget.partenaire.prenom)
        ],
      ),
      ),
      body: new Container(
        child: new InkWell(
          onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
          child: new Column(
            children: <Widget>[
              //Zone de chat
              new Flexible(child: new Container()),
              //Divider
              new Divider(height: 1.5,),
              //Zone de texte
              new ZoneDeTexteWidget(widget.partenaire, widget.id)
            ],
          ),
        ),
      ),
    );
  }
  
}