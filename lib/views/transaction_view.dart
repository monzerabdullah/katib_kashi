import 'package:flutter/material.dart';
import 'package:katib_kashi/models/transaction.dart';
import 'package:katib_kashi/utils/constants.dart';
import 'package:katib_kashi/view_models/cards_view_model.dart';
import 'package:katib_kashi/view_models/transation_view_model.dart';
import 'package:katib_kashi/views/confirm_transaction_view.dart';
import 'package:katib_kashi/views/home_view.dart';
import 'package:katib_kashi/views/sign_up_view.dart';
import 'package:katib_kashi/views/widgets/custom_slider.dart';
import 'package:provider/provider.dart';

class TransactionView extends StatefulWidget {
  TransactionView({
    super.key,
    this.selectedTransaction,
    this.selectedCardNumber,
  });
  TransactionType? selectedTransaction;
  int? selectedCardNumber;

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  TransactionType? transactionType;
  int? cardNumber;
  double? amount;
  double? fees;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    transactionType = widget.selectedTransaction;
    cardNumber = widget.selectedCardNumber;
  }

  @override
  Widget build(BuildContext context) {
    // cardNumber = widget.selectedCardNumber;
    debugPrint('card number value at first time widget is created $cardNumber');

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kPrimary,
          ),
        ),
        title: const Text(
          'Current Transaction',
          style: TextStyle(
            color: kPrimary,
          ),
        ),
        centerTitle: true,
        actions: const [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/images/user_avatar.jpg'),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      backgroundColor: kWhite,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              // TextField(
              //   onChanged: (value) {
              //     cardNumber = value;
              //   },
              //   decoration: InputDecoration(
              //     contentPadding: const EdgeInsets.all(20),
              //     filled: true,
              //     fillColor: kGrey,
              //     hintText: 'Card',
              //     hintStyle: const TextStyle(
              //       color: kSecondaryText,
              //       fontSize: 16.0,
              //     ),
              //     focusColor: kSecondary,
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer<CardsViewModel>(
                  builder: (context, model, child) {
                    return DropdownButtonFormField(
                      icon: const Icon(
                        Icons.arrow_drop_down_circle,
                        color: kSecondary,
                      ),
                      value: model.allCards
                          .singleWhere((card) => card.cardNumber == cardNumber)
                          .cardNumber,
                      onChanged: (value) {
                        debugPrint('$value');
                        setState(() {
                          selectedCardNumber = value;
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
                      hint: Text(
                          '${model.allCards.singleWhere((card) => card.cardNumber == cardNumber).cardOwnerName}'),
                      items: model.allCards.map((card) {
                        return DropdownMenuItem(
                          value: card.cardNumber,
                          child: Text(card.cardOwnerName),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                  icon: const Icon(
                    Icons.arrow_drop_down_circle,
                    color: kSecondary,
                  ),
                  dropdownColor: kWhite,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kSecondary),
                    ),
                    prefixIcon: Icon(Icons.library_books),
                    prefixIconColor: kSecondary,
                  ),
                  onChanged: (value) {
                    setState(() {
                      transactionType = value;
                    });
                  },
                  isExpanded: true,
                  hint: const Text('Transaction Type'),
                  value: transactionType,
                  items: const [
                    DropdownMenuItem(
                      value: TransactionType.receiveOnly,
                      child: Text(
                        'Reciving',
                      ),
                    ),
                    DropdownMenuItem(
                      value: TransactionType.receiveAndExchange,
                      child: Text(
                        'Reciving And Exchange',
                      ),
                    ),
                    DropdownMenuItem(
                      value: TransactionType.send,
                      child: Text(
                        'Sending',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                onChanged: (value) {
                  amount = double.tryParse(value);
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20),
                  filled: true,
                  fillColor: kGrey,
                  hintText: 'Amount',
                  hintStyle: const TextStyle(
                    color: kSecondaryText,
                    fontSize: 16.0,
                  ),
                  focusColor: kSecondary,
                  border: OutlineInputBorder(
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
                height: 30,
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  fees = double.tryParse(value);
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20),
                  filled: true,
                  fillColor: kGrey,
                  hintText: 'Transaction Fees',
                  hintStyle: const TextStyle(
                    color: kSecondaryText,
                    fontSize: 16.0,
                  ),
                  focusColor: kSecondary,
                  border: OutlineInputBorder(
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
              const Spacer(),
              ElevatedButton(
                onPressed: () async {
                  debugPrint('card number value at the provider.of$cardNumber');
                  Provider.of<TransactionViewModel>(context, listen: false)
                      .addTransaction(
                    Transaction(
                      dateTime: DateTime.now(),
                      transactionType: transactionType!,
                      cardNumber: cardNumber!,
                      transactionProfit: fees!,
                      moneyAmount: amount!.toInt(),
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
                  'Next',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: kWhite,
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
