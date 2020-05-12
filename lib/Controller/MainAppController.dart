import 'package:flutter/material.dart';

class MainAppController extends StatefulWidget {
  MainAppControllerState createState() => new MainAppControllerState();
}

class MainAppControllerState extends State<MainAppController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Center(child: new Text("Connecté"),),
    );
  }
}