import 'package:finance_guard/features/chat/data/entity/chat_message_entity.dart';
import 'package:finance_guard/features/chat/data/entity/transasaction_ai.dart';
import 'package:finance_guard/features/chat/domain/repo/chat_repo.dart';
import 'package:finance_guard/features/home/domain/entity/transaction_entity.dart';
import 'package:intl/intl.dart';

import '../service/chat_service.dart';

class ChatRepoImp implements ChatRepo {
  final service = DeepSeekCloudService();
  final formatter = DateFormat('yyyy-MM-dd');

  @override
  Future<ChatMessage> analyzeExpenses(List<TransactionEntity> expenses) async {
    final expenseForAI = expenses.map((e) =>
        AiTransactionEntity(
          date: formatter.format(e.date),
          amount: e.amount,
          name: e.name,
          comment: e.comment,
        ).toJson()).toList();

    final response = await service.sendMessage(
        "Вот список транзакций: $expenseForAI. "
            "Проанализируй расходы и дай короткий совет, как улучшить финансовое поведение."
    );

    return ChatMessage(isUser: false, content: response);
  }

  @override
  Future<ChatMessage> sendMessage(String message) async {
    final response = await service.sendMessage(message);
    return ChatMessage(isUser: false, content: response);
  }

}