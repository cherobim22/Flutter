import 'package:chatapp/core/models/chat_notification.dart';
import 'package:flutter/material.dart';

class ChatNotificationService with ChangeNotifier {
  List<ChatNotification> _items = [];

  List<ChatNotification> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  void add(ChatNotification notification) {
    _items.add(notification);
    notifyListeners();
  }

  void remove(int i) {
    _items.removeAt(i);
  }

  //Push Notification
  Future<void> init() async {
    _configureForeground();
  }

  Future<void> _configureForeground() async {}
  Future<bool> get _isAuthorized async {
    return false;
  }
}
