import 'package:chatapp/core/models/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool belongsToMe;
  const MessageBubble(
      {Key? key, required this.message, required this.belongsToMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: belongsToMe
              ? Colors.grey.shade300
              : Theme.of(context).primaryColor),
      child: Text(message.text),
    );
  }
}
