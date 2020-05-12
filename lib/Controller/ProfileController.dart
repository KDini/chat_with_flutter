import 'package:flutter/material.dart';

class ProfileController extends StatefulWidget {

  String id;

  ProfileController(String id){
    this.id = id;
  }

  ProfileControllerState createState() => new ProfileControllerState();
}

class ProfileControllerState extends State<ProfileController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Text("Profil"),
    );
  }

}