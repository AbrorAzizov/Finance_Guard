
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/domain/entity/transaction_entity.dart';
import '../data/entity/chat_message_entity.dart';
import '../domain/repo/chat_repo.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo repo;

  final List<ChatMessage> _messages = [];

  ChatCubit(this.repo) : super(ChatInitial());

  Future<void> sendUserMessage(String text) async {
    try {
      _messages.add(ChatMessage(isUser: true, content: text));

      emit(ChatLoaded(List.from(_messages)));
      emit(ChatLoading());


      final aiMessage = await repo.sendMessage(text);

      _messages.add(aiMessage);

      emit(ChatLoaded(List.from(_messages)));
    } catch (e) {

      emit(ChatError(e.toString()));
    }
  }
  Future<void> analyzeMyGoals(List<TransactionEntity> expenses) async {
    try {
      _messages.add(ChatMessage(isUser: true, content: 'analyze my goals '));

      emit(ChatLoading());
      final aiMessage = await repo.analyzeMyGoals(expenses);
      _messages.add(aiMessage);
      emit(ChatLoaded(List.from(_messages)));
    } catch (e) {

      emit(ChatError(e.toString()));
    }
  }

  Future<void> analyzeExpenses(List<TransactionEntity> expenses) async {
    try {
      _messages.add(ChatMessage(isUser: true, content: 'analyze my expenses '));

      emit(ChatLoading());
      final aiMessage = await repo.analyzeExpenses(expenses);
      _messages.add(aiMessage);

      emit(ChatLoaded(List.from(_messages)));
    } catch (e) {
      debugPrint(e as String?);
      emit(ChatError(e.toString()));
    }


  }
}