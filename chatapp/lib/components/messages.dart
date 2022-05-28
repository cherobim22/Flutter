import 'package:chatapp/core/models/chat_message.dart';
import 'package:chatapp/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ChatMessage>>(
      stream: ChatService().messageStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData) {
          return Center(child: Text('Sem dados'));
        } else {
          final msgs = snapshot.data!;
          return ListView.builder(
            itemCount: msgs.length,
            itemBuilder: (ctx, i) => Text(msgs[i].text),
          );
        }
      },
    );
  }
}
