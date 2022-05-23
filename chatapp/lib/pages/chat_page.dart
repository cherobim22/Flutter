import 'package:chatapp/core/services/auth/auth_mock_service.dart';
import 'package:chatapp/core/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('chat page'),
            TextButton(
                onPressed: () {
                  AuthService().logout();
                },
                child: Text('Logout'))
          ],
        ),
      ),
    );
  }
}
