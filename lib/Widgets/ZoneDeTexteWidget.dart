import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:chatwithflutter/Model/FirebaseHelper.dart';
import 'package:chatwithflutter/Model/User.dart';

class ZoneDeTexteWidget extends StatefulWidget {
  User partenaire;
  String id;

  ZoneDeTexteWidget(User partenaire, String id){
    this.partenaire = partenaire;
    this.id = id;
  }

  ZoneState createState() => new ZoneState();
}

class ZoneState extends State<ZoneDeTexteWidget> {
  
  TextEditingController _textEditingController = new TextEditingController();
  User moi;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseHelper().getUser(widget.id).then((user) {
      setState(() {
        moi = user;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: Colors.grey[300],
      padding: EdgeInsets.all(5.0),
      child: new Row(
        children: <Widget>[
          new IconButton(icon: new Icon(Icons.camera_enhance), onPressed: null),
          new IconButton(icon: new Icon(Icons.photo_library), onPressed: null),
          new Flexible(
              child: new TextField(
                controller: _textEditingController,
                decoration: new InputDecoration.collapsed(hintText: "Ecrivez quelque chose"),
                maxLines: null,
              )
          ),
          new IconButton(icon: new Icon(Icons.send), onPressed: _sendButtonPressed)
        ],
      ),
    );
  }

  _sendButtonPressed() {
    if (_textEditingController.text != null && _textEditingController.text != ""){
      String text = _textEditingController.text;
      FirebaseHelper().sendMessage(widget.partenaire, moi, text, null);
      FocusScope.of(context).requestFocus(new FocusNode());
    } else {
      print("Texte vide ou null");
    }
  }
  
}