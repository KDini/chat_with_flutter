import 'package:flutter/material.dart';

class ContactController extends StatefulWidget {
  String id;

  ContactController(String id) {
    this.id = id;
  }

  ContactControllerState createState() => new ContactControllerState();
}

class ContactControllerState extends State<ContactController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Text("Contact"),
    );;
  }

}