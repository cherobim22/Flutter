import 'package:chatapp/core/services/auth/auth_service.dart';
import 'package:chatapp/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  String _newMessage = '';
  final _messageController = TextEditingController();

  Future<void> _sendMessage() async {
    final user = AuthService().currentUser;
    if (user != null) {
      ChatService().save(_newMessage, user);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _newMessage = value;
                });
              },
              controller: _messageController,
              decoration: InputDecoration(labelText: 'Enviar Mensagem'),
            ),
          ),
          IconButton(
            onPressed: _newMessage.trim().isEmpty ? null : _sendMessage,
            icon: Icon(Icons.send),
          )
        ],
      ),
    );
  }
}
