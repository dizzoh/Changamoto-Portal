import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:society/admin/adminscreen.dart';
import 'package:society/screens/home.dart';

class SplashScreen extends StatefulWidget {
  //const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String role = 'user';

  //String get id => UserModel.STRIPE_ID;

  @override
  void initState() {
    super.initState();
    _checkRole();
  }

  Future<void> _checkRole() async {
    final user = await FirebaseAuth.instance.currentUser();
    final DocumentSnapshot snap =
        await Firestore.instance.collection('users').document(user.uid).get();

    setState(() {
      role = snap['role'];
    });
    if (role == 'user') {
      NavigetNext(HomeScreen());
    } else if (role == 'admin') {
      NavigetNext(AdminiScreen());
    }
  }

  void NavigetNext(Widget route) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => route));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lord God"),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Text('Help Me'),
            )
          ],
        ),
      ),
    );
  }
}
