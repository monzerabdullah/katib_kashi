import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:katib_kashi/models/card.dart';
import 'package:katib_kashi/utils/constants.dart';
import 'package:katib_kashi/view_models/cards_view_model.dart';
import 'package:katib_kashi/views/confirm_transaction_view.dart';
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
  int? cardNumber;
  int? currentBalance;
  int? phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kPrimary,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kWhite,
          ),
        ),
        title: const Text(
          'Add New Card',
          style: TextStyle(color: kWhite),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height + 150,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                    onChanged: (value) {
                      setState(() {
                        cardType = value;
                      });
                    },
                    isExpanded: true,
                    dropdownColor: kWhite,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kSecondary),
                      ),
                      prefixIcon: Icon(Icons.credit_card_rounded),
                      prefixIconColor: kSecondary,
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down_circle,
                      color: kSecondary,
                    ),
                    hint: const Text('Card Type'),
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
                const SizedBox(height: 25),
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
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: kSecondary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                TextField(
                  keyboardType: TextInputType.number,
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.digitsOnly,
                  // ],
                  onChanged: (value) {
                    cardNumber = int.tryParse(value);
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
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: kSecondary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    currentBalance = int.tryParse(value);
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
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: kSecondary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    phoneNumber = int.tryParse(value);
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
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: kSecondary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<CardsViewModel>(context, listen: false)
                        .addNewCard(
                      CardModel(
                        cardOwnerName: fullName!,
                        cardCurrentBalance: currentBalance!.toDouble(),
                        cardNumber: cardNumber!,
                        phoneNumber: phoneNumber!,
                      ),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ConfirmTransactionView(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kSecondary,
                    minimumSize: const Size.fromHeight(64),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
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
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
