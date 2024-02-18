import 'package:flutter/material.dart';
import 'package:katib_kashi/models/transaction.dart';

class TransactionViewModel with ChangeNotifier {
  List<Transaction> allTranasctions = [];

  void addTransaction(Transaction transaction) {
    allTranasctions.add(transaction);
    notifyListeners();
  }

  double income() {
    double income = 0.0;
    for (var transaction in allTranasctions) {
      income += transaction.transactionProfit;
    }
    return income;
  }

  double sent() {
    double sent = 0.0;
    for (var transaction in allTranasctions.where(
      (tr) => tr.transactionType == TransactionType.send,
    )) {
      sent += transaction.transactionProfit;
    }
    return sent;
  }

  double recived() {
    double recived = 0.0;
    for (var transaction in allTranasctions.where(
      (tr) => tr.transactionType != TransactionType.send,
    )) {
      recived += transaction.transactionProfit;
    }
    return recived;
  }
}
