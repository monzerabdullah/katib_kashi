import 'package:flutter/material.dart';
import 'package:katib_kashi/models/transaction.dart';
import 'package:katib_kashi/views/widgets/single_action_button.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ActionButton(
            icon: Icons.arrow_upward,
            label: 'Send',
            transactionType: TransactionType.send,
          ),
          ActionButton(
            icon: Icons.arrow_downward,
            label: 'Recive',
            transactionType: TransactionType.receiveOnly,
          ),
          ActionButton(
            icon: Icons.swap_vert,
            label: 'Exchange',
            transactionType: TransactionType.receiveAndExchange,
          ),
          ActionButton(
            icon: Icons.more_horiz,
            label: 'More',
            transactionType: TransactionType.send,
          ),
        ],
      ),
    );
  }
}
