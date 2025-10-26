import 'package:finance_guard/core/constants/app_colors.dart';
import 'package:finance_guard/core/dialog/loading_dialog.dart';
import 'package:finance_guard/features/chat/bloc/chat_cubit.dart';
import 'package:finance_guard/features/chat/bloc/chat_state.dart';
import 'package:finance_guard/features/chat/widgets/chat_buble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/bloc/transaction_bloc/transaction_cubit.dart';
import '../../home/bloc/transaction_bloc/transaction_state.dart';
import 'initial_chat_view.dart';

class AiOverviewPage extends StatefulWidget {
  const AiOverviewPage({super.key});

  @override
  State<AiOverviewPage> createState() => _AiOverviewPageState();
}

class _AiOverviewPageState extends State<AiOverviewPage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.cardBackground,
        centerTitle: true,
        title: Text('Ai assistant'),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<TransactionCubit, TransactionState>(
                  builder: (context, state) {
                    if (state is TransactionStateSummary) {
                      return BlocBuilder<ChatCubit, ChatState>(
                        builder: (context, chatState) {
                          if (chatState is ChatLoaded) {
                            final messages = chatState.messages;
                            return ListView.builder(
                              itemCount: messages.length,
                              itemBuilder: (context, index) {
                                final message = messages[index];
                                return ChatBubble(message: message);
                              },
                            );
                          }
                          if (chatState is ChatLoading) {
                            return const Center(child: Loading());
                          }
                          if (chatState is ChatError) {
                            return Center(child: Text(chatState.message));
                          }
                          return const Center(child: InitialChatView());
                        },
                      );
                    }


                    return Container();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: "Enter a message...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        final text = _controller.text.trim();
                        if (text.isNotEmpty) {
                          context.read<ChatCubit>().sendUserMessage(text);
                          _controller.clear();
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}