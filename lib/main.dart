import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './Controller/MainAppController.dart';
import './Controller/LoginController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _handleAuth(),
    );
  }

  Widget _handleAuth() {
    return new StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot){
          if (snapshot.hasData){
            //Authentified
            return new MainAppController();
          } else {
            //Not authentified
            return new LoginController();
          }
        }
    );
  }
}