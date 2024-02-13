class Card {
  Card({
    required this.cardOwnerName,
    required this.cardCurrentBalance,
    required this.cardNumber,
    this.phoneNumber,
    this.cardType,
  });
  String cardOwnerName;
  double cardCurrentBalance;
  //think of it securly
  int cardNumber;
  int? phoneNumber;
  CardType? cardType;
}

enum CardType {
  vodaPhone,
  etislate,
  orange,
  bank,
}
