import 'dart:async';
import 'dart:math';
import 'package:chatapp/core/models/chat_message.dart';
import 'package:chatapp/core/models/chat_user.dart';
import 'package:chatapp/core/services/chat/chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [
    ChatMessage(
      id: Random().nextDouble().toString(),
      text: 'OLa',
      createdAt: DateTime.now(),
      userId: Random().nextDouble().toString(),
      userNAme: 'Cafu',
      userImageUrl: "https://i.pravatar.cc/300",
    ),
    ChatMessage(
      id: Random().nextDouble().toString(),
      text: 'Beleza ?',
      createdAt: DateTime.now(),
      userId: Random().nextDouble().toString(),
      userNAme: 'Lucio',
      userImageUrl: "https://i.pravatar.cc/300",
    ),
  ];
  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    controller.add(_msgs);
  });

  Stream<List<ChatMessage>> messageStream() {
    return _msgStream;
  }

  Future<ChatMessage> save(String text, ChatUser user) async {
    final newMessage = ChatMessage(
      id: Random().nextDouble().toString(),
      text: text,
      createdAt: DateTime.now(),
      userId: user.id,
      userNAme: user.name,
      userImageUrl: user.imageUrl,
    );
    _msgs.add(newMessage);
    _controller?.add(_msgs);
    return newMessage;
  }
}
