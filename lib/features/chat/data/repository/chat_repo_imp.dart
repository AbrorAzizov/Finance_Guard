import 'package:finance_guard/features/chat/data/entity/chat_message_entity.dart';
import 'package:finance_guard/features/chat/data/entity/transasaction_ai.dart';
import 'package:finance_guard/features/chat/domain/repo/chat_repo.dart';
import 'package:finance_guard/features/home/domain/entity/transaction_entity.dart';
import 'package:intl/intl.dart';

import '../service/chat_service.dart';


class ChatRepoImp implements ChatRepo {
  final DeepSeekCloudService _chatService;
  final formatter = DateFormat('yyyy-MM-dd');

  ChatRepoImp(this._chatService);

  @override
  Future<ChatMessage> analyzeExpenses(List<TransactionEntity> expenses) async {
    try {
      final expenseForAI = expenses.map((e) =>
          AiTransactionEntity(
            date: formatter.format(e.date),
            amount: e.amount,
            name: e.name,
            comment: e.comment,
          ).toJson()).toList();

      final response = await _chatService.sendMessage(
          "Вот список транзакций: $expenseForAI. "
              "Проанализируй расходы и дай короткий совет, как улучшить финансовое поведение."
      );

      return ChatMessage(isUser: false, content: response);
    } catch (e) {
      // Log the error for debugging
      print('Error analyzing expenses: $e');
      return ChatMessage(isUser: false, content: "Не удалось проанализировать расходы. Пожалуйста, попробуйте позже.");
    }
  }

  @override
  Future<ChatMessage> sendMessage(String message) async {
    try {
      final response = await _chatService.sendMessage(message);
      return ChatMessage(isUser: false, content: response);
    } catch (e) {
      // Log the error for debugging
      print('Error sending message: $e');
      return ChatMessage(isUser: false, content: "Не удалось отправить сообщение. Пожалуйста, попробуйте позже.");
    }
  }
}