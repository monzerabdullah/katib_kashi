import 'package:flutter/material.dart';
import 'package:katib_kashi/models/transaction.dart';

class TransactionViewModel extends ChangeNotifier {
  List<Transaction> allTranasctions = [];

  void addTransaction(Transaction transaction) {
    allTranasctions.add(transaction);
    notifyListeners();
  }
}
