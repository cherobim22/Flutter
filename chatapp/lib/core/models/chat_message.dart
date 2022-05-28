class ChatMessage {
  final String id;
  final String text;
  final DateTime createdAt;

  final String userId;
  final String userNAme;
  final String userImageUrl;

  const ChatMessage({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.userId,
    required this.userNAme,
    required this.userImageUrl,
  });
}
