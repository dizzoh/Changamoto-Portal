import 'package:flutter/material.dart';

class MbungePage extends StatefulWidget {
  const MbungePage({Key key}) : super(key: key);

  @override
  _MbungePageState createState() => _MbungePageState();
}

class _MbungePageState extends State<MbungePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My name'),
      ),
    );
  }
}
