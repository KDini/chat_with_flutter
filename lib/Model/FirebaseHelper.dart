import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:chatwithflutter/Model/User.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class FirebaseHelper {
  //Authentification
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<FirebaseUser> handleSignIn(String mail, String password) async {
    final FirebaseUser user = (await auth.signInWithEmailAndPassword(email: mail, password: password)).user;
    return user;
  }

  Future<FirebaseUser> handleCreate(String mail, String password, String prenom, String nom) async {
    final FirebaseUser user = (await auth.createUserWithEmailAndPassword(email: mail, password: password)).user;
    String uid = user.uid;
    Map<String, String> map = {
      "uid": uid,
      "prenom": prenom,
      "nom": nom
    };
    addUser(uid, map);
    return user;

  }

  Future<bool> handleLogOut() async {
    await auth.signOut();
    return true;
  }

  Future<String> myId() async {
    FirebaseUser user = await auth.currentUser();
    return user.uid;
  }

  //Database

  static final base = FirebaseDatabase.instance.reference();
  final base_user = base.child("users");

  addUser(String id, Map map) {
    base_user.child(id).set(map);
  }

  Future<User> getUser(String id) async {
    DataSnapshot snapshot = await base_user.child(id).once();
    return new User(snapshot);
  }

  //Storage
  static final base_storage = FirebaseStorage.instance.ref();
  final StorageReference storage_users = base_storage.child("users");

  Future<String> savePicture(File file, StorageReference storageReference) async {
    StorageUploadTask storageUploadTask = storageReference.putFile(file);
    StorageTaskSnapshot snapshot = await storageUploadTask.onComplete;
    String url = await snapshot.ref.getDownloadURL();
    return url;
  }

}