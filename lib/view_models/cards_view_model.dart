import 'package:flutter/material.dart';

class CardsViewModel with ChangeNotifier {
  List<Card> allCards = [];

  void addNewCard(Card card) {
    allCards.add(card);
    notifyListeners();
  }
}
