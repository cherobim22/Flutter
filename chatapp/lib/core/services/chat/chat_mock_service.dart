import 'dart:async';
import 'dart:math';
import 'package:chatapp/core/models/chat_message.dart';
import 'package:chatapp/core/models/chat_user.dart';
import 'package:chatapp/core/services/chat/chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [
    ChatMessage(
      id: '1',
      text: 'Salve Lucio',
      createdAt: DateTime.now(),
      userId: '3',
      userNAme: 'Cafu',
      userImageUrl: "https://i.pravatar.cc/300",
    ),
    ChatMessage(
      id: '2',
      text: 'Salve Cafu, beleza ?',
      createdAt: DateTime.now(),
      userId: '6',
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
