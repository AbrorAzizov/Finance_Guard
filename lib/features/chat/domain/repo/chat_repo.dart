import 'package:finance_guard/features/home/domain/entity/transaction_entity.dart';

import '../../data/entity/chat_message_entity.dart';

abstract class ChatRepo {
  Future<ChatMessage> sendMessage (String content);
  Future<ChatMessage> analyzeExpenses (List<TransactionEntity> expenses);
}