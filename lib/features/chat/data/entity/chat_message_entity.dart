class ChatMessage {
  final bool isUser;     // "user" or "assistant"
  final String content;

  ChatMessage({required this.isUser, required this.content});

}
