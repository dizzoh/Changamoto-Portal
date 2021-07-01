import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  // const MessageBubble({Key key}) : super(key: key);
  MessageBubble(this.message, this.name, this.isMe, {this.key});

  final Key key;
  final String message;
  final String name;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isMe ? Colors.grey : Theme.of(context).accentColor,
              //color: isMe ? Colors.grey[300] : Colors.purple,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(12),
                bottomRight: isMe ? Radius.circular(0) : Radius.circular(12),
              ),
            ),
            width: 130,
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 16,
            ),
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      backgroundColor:
                          isMe ? Colors.transparent : Colors.purpleAccent,
                    ),
                  ),
                  Center(
                    child: Text(
                      message,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isMe
                            ? Colors.white
                            : Theme.of(context).accentTextTheme.title.color,
                        //color: isMe ? Colors.teal : Colors.purpleAccent,
                      ),
                      textAlign: isMe ? TextAlign.end : TextAlign.start,
                    ),
                  ),
                ]),
          ),
        ]);
  }
}
