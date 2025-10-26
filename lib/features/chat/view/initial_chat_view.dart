import 'package:finance_guard/core/constants/text_styles.dart';
import 'package:finance_guard/features/chat/bloc/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../home/bloc/transaction_bloc/transaction_cubit.dart';
import '../../home/bloc/transaction_bloc/transaction_state.dart';

class InitialChatView extends StatelessWidget {
  const InitialChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {

       if (state is TransactionStateSummary){
         return Column(
           mainAxisSize: MainAxisSize.min,
           children: [
             Text(
               'What can i help with',
               style: AppTextStyles.chatTitle,
             ),
             SizedBox(
               height: 20,
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: SizedBox(
                   height: 50.h,
                   child:ElevatedButton(
                     onPressed: () {
                       context.read<ChatCubit>().analyzeExpenses(state.weekData.expenses);
                     },
                     style: ElevatedButton.styleFrom(
                       backgroundColor: AppColors.cardBackground, // фон кнопки
                       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),

                     ),
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         SizedBox(width: 5.w),
                         Icon(
                           Icons.bar_chart,
                           color: Colors.green,
                           size: 30.h,
                         ),
                         SizedBox(width: 10.w),
                         Text(
                           'Analyze my last expenses',
                           style: const TextStyle(
                             color: Colors.white, // ✅ белый текст
                             fontSize: 16,
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                         SizedBox(width: 5.h),
                       ],
                     ),
                   )

               ),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: SizedBox(
                   height: 50.h,
                   child:ElevatedButton(
                     onPressed: () {
                       context.read<ChatCubit>().analyzeMyGoals( state.weekData.expenses);
                     },
                     style: ElevatedButton.styleFrom(
                       backgroundColor: AppColors.cardBackground, // фон кнопки
                       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),

                     ),
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         SizedBox(width: 5.h),
                         Icon(
                           Icons.ssid_chart,
                           color: Colors.deepOrangeAccent,
                           size: 30.h,
                         ),
                         SizedBox(width: 10.h),
                         Text(
                           'How to reach my goal faster ',
                           style: const TextStyle(
                             color: Colors.white,
                             fontSize: 16,
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                         SizedBox(width: 5.h),
                       ],
                     ),
                   )

               ),
             ),
           ],
         );
       }
       return Container();
      }
    );
  }
}
