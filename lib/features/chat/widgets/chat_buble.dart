import 'package:finance_guard/features/chat/data/entity/chat_message_entity.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    print(message.content);
    final isUser = message.isUser;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
      isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        // Показываем аватарку только если это ассистент
        if (!isUser)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.smart_toy, size: 18, color: Colors.black54),
            ),
          ),

        // Сам пузырь
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: isUser ? Colors.blueAccent : Colors.grey[200],
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12),
                topRight: const Radius.circular(12),
                bottomLeft:
                isUser ? const Radius.circular(12) : const Radius.circular(0),
                bottomRight:
                isUser ? const Radius.circular(0) : const Radius.circular(12),
              ),
            ),
            child: Text(
              message.content,
              style: TextStyle(
                color: isUser ? Colors.white : Colors.black87,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

