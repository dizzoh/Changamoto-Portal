import 'package:flutter/material.dart';

class AdminiScreen extends StatefulWidget {
  const AdminiScreen({Key key}) : super(key: key);

  @override
  _AdminiScreenState createState() => _AdminiScreenState();
}

class _AdminiScreenState extends State<AdminiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thanks "),
      ),
      body: Center(
        child: Text('Welcome '),
      ),
    );
  }
}
