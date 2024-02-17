import 'package:flutter/material.dart';
import 'package:katib_kashi/models/card.dart';

class CardsViewModel with ChangeNotifier {
  List<CardModel> allCards = [];

  int getCardNumber(int index) {
    return allCards[index].cardNumber;
  }

  // CardModel getCardWithNumber(int cardNumber) {
  //   return allCards.w
  // }

  void addNewCard(CardModel card) {
    allCards.add(card);
    notifyListeners();
  }
}
