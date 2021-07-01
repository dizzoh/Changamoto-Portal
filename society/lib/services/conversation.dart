import 'package:flutter/material.dart';
import 'package:society/chats/messages.dart';
import 'package:society/chats/new_message.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({Key key}) : super(key: key);

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Let us associate'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Messages(),
          ),
          NewMessage(),
        ],
      ),
    );
  }
}
