import 'package:flutter/material.dart';
import 'package:katib_kashi/view_models/transation_view_model.dart';
import 'package:katib_kashi/views/widgets/transaction_custom_widget.dart';
import 'package:provider/provider.dart';

class AllTransactions extends StatelessWidget {
  const AllTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionViewModel>(
      builder: (contex, model, child) {
        return ListView.builder(
          itemCount: model.allTranasctions.length,
          itemBuilder: (context, index) {
            final transaction = model.allTranasctions[index];
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
