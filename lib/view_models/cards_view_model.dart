import 'package:flutter/material.dart';
import 'package:katib_kashi/models/card.dart';

class CardsViewModel with ChangeNotifier {
  List<CardModel> allCards = [];

  void addNewCard(CardModel card) {
    allCards.add(card);
    notifyListeners();
  }
}
