import 'package:flutter/material.dart';
import 'package:katib_kashi/models/transaction.dart';
import 'package:katib_kashi/view_models/transation_view_model.dart';
import 'package:katib_kashi/views/widgets/transaction_custom_widget.dart';
import 'package:provider/provider.dart';

class SendingTransactions extends StatelessWidget {
  const SendingTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionViewModel>(
      builder: (contex, model, child) {
        final sendingTransactions = model.allTranasctions
            .where((tr) => tr.transactionType == TransactionType.send)
            .toList();
        return ListView.builder(
          itemCount: sendingTransactions.length,
          itemBuilder: (context, index) {
            final transaction = sendingTransactions[index];
            return TransactionWidget(
              dateTime: transaction.dateTime,
              type: transaction.transactionType,
              amount: transaction.moneyAmount,
              cardNumber: transaction.cardNumber,
            );
          },
        );
      },
    );
  }
}
