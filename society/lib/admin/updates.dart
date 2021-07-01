import 'package:flutter/material.dart';

class UpdatesPage extends StatefulWidget {
  const UpdatesPage({Key key}) : super(key: key);

  @override
  _UpdatesPageState createState() => _UpdatesPageState();
}

class _UpdatesPageState extends State<UpdatesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get New Updates Here!'),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Text('This is my Update Page'),
            )
          ],
        ),
      ),
    );
  }
}
