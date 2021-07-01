import 'dart:html';

import 'package:flutter/material.dart';
import 'package:society/admin/updates.dart';
import 'package:society/screens/login1.dart';
import 'package:society/services/conversation.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Social"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('data'),
              accountEmail: Text('mu'),
            ),
            buildItemMenu(
              text: 'Updates',
              icon: Icons.update,
              onClicked: () => selectedItem(context, 0),
            ),
            SizedBox(
              height: 15,
            ),
            buildItemMenu(
              text: 'Conversation',
              icon: Icons.chat,
              onClicked: () => selectedItem(context, 1),
            ),
            SizedBox(
              height: 15,
            ),
            buildItemMenu(
              text: 'Profile',
              icon: Icons.account_box,
              onClicked: () => selectedItem(context, 2),
            ),
            buildItemMenu(
              text: 'Log Out',
              icon: Icons.logout,
              onClicked: () => selectedItem(context, 3),
            )
          ],
        ),
      ),
      body: Container(
          child: Column(
        children: [
          Center(
            child: Text('Welcome'),
          )
        ],
      )),
    );
  }

  Widget buildItemMenu({String text, IconData icon, VoidCallback onClicked}) {
    final color = Colors.black;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        text,
        style:
            TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: color),
      ),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UpdatesPage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ConversationScreen(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UpdatesPage(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginOne(),
        ));
        break;
    }
  }
}
