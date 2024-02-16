import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:katib_kashi/models/card.dart';
import 'package:katib_kashi/utils/constants.dart';
import 'package:katib_kashi/view_models/cards_view_model.dart';
import 'package:katib_kashi/views/home_view.dart';
import 'package:provider/provider.dart';

class NewCardView extends StatefulWidget {
  const NewCardView({super.key});

  @override
  State<NewCardView> createState() => _NewCardViewState();
}

class _NewCardViewState extends State<NewCardView> {
  //it should be a ShowModel
  CardType? cardType;
  String? fullName;
  String? cardNumber;
  String? currentBalance;
  String? phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kPrimary,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: kWhite,
          ),
        ),
        title: Text(
          'Add New Card',
          style: TextStyle(color: kWhite),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height + 150,
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
                height: 200,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      // TextField(
                      //   onChanged: (value) {},
                      //   decoration: InputDecoration(
                      //     contentPadding: const EdgeInsets.all(20),
                      //     filled: true,
                      //     fillColor: kGrey,
                      //     hintText: 'Card Type',
                      //     hintStyle: const TextStyle(
                      //       color: kSecondaryText,
                      //       fontSize: 16.0,
                      //     ),
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.circular(20),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          onChanged: (value) {
                            setState(() {
                              cardType = value;
                            });
                          },
                          isExpanded: true,
                          hint: const Text('Transaction Type'),
                          value: cardType,
                          items: const [
                            DropdownMenuItem(
                              value: CardType.bank,
                              child: Text(
                                'Banking',
                              ),
                            ),
                            DropdownMenuItem(
                              value: CardType.etislate,
                              child: Text(
                                'Etisalat',
                              ),
                            ),
                            DropdownMenuItem(
                              value: CardType.vodaPhone,
                              child: Text(
                                'Voda',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        onChanged: (value) {
                          fullName = value;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20),
                          filled: true,
                          fillColor: kGrey,
                          hintText: 'Full Name',
                          hintStyle: const TextStyle(
                            color: kSecondaryText,
                            fontSize: 16.0,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        onChanged: (value) {
                          cardNumber = value;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20),
                          filled: true,
                          fillColor: kGrey,
                          hintText: 'Card Number',
                          hintStyle: const TextStyle(
                            color: kSecondaryText,
                            fontSize: 16.0,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        onChanged: (value) {
                          currentBalance = value;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20),
                          filled: true,
                          fillColor: kGrey,
                          hintText: 'Current Balance',
                          hintStyle: const TextStyle(
                            color: kSecondaryText,
                            fontSize: 16.0,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        onChanged: (value) {
                          phoneNumber = value;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20),
                          filled: true,
                          fillColor: kGrey,
                          hintText: 'Phone Number',
                          hintStyle: const TextStyle(
                            color: kSecondaryText,
                            fontSize: 16.0,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 35),
                      GestureDetector(
                        onTap: () {
                          Provider.of<CardsViewModel>(context, listen: false)
                              .addNewCard(
                            CardModel(
                              cardOwnerName: fullName!,
                              cardCurrentBalance: double.parse(currentBalance!),
                              cardNumber: int.parse(cardNumber!),
                            ),
                          );
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 62,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: kSecondary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Add',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: kWhite,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
