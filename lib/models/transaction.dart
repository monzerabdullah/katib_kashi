class Transaction {
  Transaction({
    this.moneyAmount = 0,
    this.transactionProfit = 0,
    required this.dateTime,
    required this.transactionType,
    required this.cardNumber,
  });
  final int moneyAmount;
  final double transactionProfit;
  final DateTime dateTime;
  final TransactionType transactionType;
  final int cardNumber;
}

enum TransactionType { receiveOnly, receiveAndExchange, send }
