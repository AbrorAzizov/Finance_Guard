import 'package:finance_guard/features/budget/domain/repo/goal_repo_imp.dart';
import 'package:finance_guard/features/chat/data/entity/chat_message_entity.dart';
import 'package:finance_guard/features/chat/data/entity/transasaction_ai.dart';
import 'package:finance_guard/features/chat/domain/repo/chat_repo.dart';
import 'package:finance_guard/features/home/domain/entity/transaction_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../service/chat_service.dart';


class ChatRepoImp implements ChatRepo {
  final GoalsRepo goalsRepo;
  final DeepSeekCloudService _chatService;
  final formatter = DateFormat('yyyy-MM-dd');

  ChatRepoImp(this._chatService, this.goalsRepo);

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
          "Here is the list of transactions: $expenseForAI. "
              "Analyze the expenses and give me a short piece of advice on how to improve my financial behavior."
      );


      return ChatMessage(isUser: false, content: response);
    } catch (e) {
      // Log the error for debugging
      debugPrint('Error analyzing expenses: $e');
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
      debugPrint('Error sending message: $e');
      return ChatMessage(isUser: false, content: "Не удалось отправить сообщение. Пожалуйста, попробуйте позже.");
    }
  }

  @override
  Future<ChatMessage> analyzeMyGoals(List<TransactionEntity> expenses) async{
    try {
      final expenseForAI = expenses.map((e) =>
          AiTransactionEntity(
            date: formatter.format(e.date),
            amount: e.amount,
            name: e.name,
            comment: e.comment,
          ).toJson()).toList();

      final goals = await goalsRepo.getGoals();
      final jsonGoals = goals.map((e) => e.toJson(),);

      final response = await _chatService.sendMessage(
          "Here is the list of transactions: $expenseForAI and here are my goals: $jsonGoals. "
              "Analyze the expenses and give me a short piece of advice on how I can reach my goals faster."
      );


      return ChatMessage(isUser: false, content: response);
    } catch (e) {
      // Log the error for debugging
      debugPrint('Error analyzing expenses: $e');
      return ChatMessage(isUser: false, content: "Не удалось проанализировать расходы. Пожалуйста, попробуйте позже.");
    }
  }
}