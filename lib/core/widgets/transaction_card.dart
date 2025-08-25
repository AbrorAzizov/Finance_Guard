import 'package:finance_guard/features/home/domain/entity/transaction_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class TransactionCard extends StatefulWidget {
  final List<TransactionEntity> transactions;

  const TransactionCard({super.key, required this.transactions});

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemCount: widget.transactions.length,
         itemBuilder: (context, index) {
       final transaction = widget.transactions[index];
       return  Container(
         margin: const EdgeInsets.symmetric(vertical: 6, ),
         padding: const EdgeInsets.all(16),
         decoration: BoxDecoration(
           color: const Color(0xFF0E2A47), // background
           borderRadius: BorderRadius.circular(12),
         ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             // Left side (Type & Amount)
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   transaction.type,
                   style: const TextStyle(
                     color: Colors.white70,
                     fontSize: 14,
                   ),
                 ),
                 const SizedBox(height: 6),
                 Text(
                   NumberFormat.currency(
                     locale: "en_US",
                     symbol:transaction.type == "income" ? "\$" : '-\$',
                   ).format(transaction.amount),
                   style: TextStyle(
                     color: transaction.type == "income" ? Colors.green : Colors.red,
                     fontSize: 18,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ],
             ),

             // Right side (Date & Category)
             Column(
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 Text(
                   DateFormat("MMM d").format(transaction.date),
                   style: const TextStyle(
                     color: Colors.white70,
                     fontSize: 14,
                   ),
                 ),
                 const SizedBox(height: 6),
                 Row(
                   children: [
                     Icon(Icons.circle, color: Color(transaction.categoryColor), size: 12),
                     const SizedBox(width: 6),
                     Text(
                       transaction.name,
                       style: const TextStyle(
                         color: Colors.white,
                         fontSize: 14,
                       ),
                     ),
                   ],
                 ),
               ],
             ),
           ],
         ),
       );
         },
      ),
    );
  }
}
