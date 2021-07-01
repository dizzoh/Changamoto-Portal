import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:society/models/user.dart';
import 'package:society/services/user.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserProvider with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  Status get status => _status;
  FirebaseUser get user => _user;
  Firestore _firestore = Firestore.instance;
  UserService _userService = UserService();
  UserModel _userModel;

//  we will make this variables public for now
  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController jimbo = TextEditingController();
  TextEditingController _LeaderController = TextEditingController();

  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }

  Future<bool> signIn() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .signInWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((value) => print(value));
      print("data in signin");
      print(Status.Authenticated.toString());
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      var result = await _auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      _firestore.collection('users').document(result.user.uid).setData({
        'name': name.text,
        'email': email.text,
        'jimbo': jimbo.text,
        'uid': result.user.uid,
        'role': 'user'
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future signOut() async {
    _auth.signOut();

    //Button For leader to edit profile not implemented previously

    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  void clearController() {
    name.text = "";
    password.text = "";
    email.text = "";
    jimbo.text = "";
  }

  Future<void> _onStateChanged(FirebaseUser user) async {
    if (user == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = user;
      _status = Status.Authenticated;
      _userModel = await _userService.getUserById(user.uid);
    }
    notifyListeners();
  }

//Not implemented previously

}
