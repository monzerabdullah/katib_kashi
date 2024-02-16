import 'package:flutter/material.dart';
import 'package:katib_kashi/models/transaction.dart';
import 'package:katib_kashi/utils/constants.dart';
import 'package:katib_kashi/view_models/transation_view_model.dart';
import 'package:katib_kashi/views/confirm_transaction_view.dart';
import 'package:katib_kashi/views/home_view.dart';
import 'package:katib_kashi/views/sign_up_view.dart';
import 'package:provider/provider.dart';

class TransactionView extends StatefulWidget {
  const TransactionView({super.key});

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  TransactionType? transactionType;
  String? cardNumber;
  String? amount;
  String? fees;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
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
              TextField(
                onChanged: (value) {
                  cardNumber = value;
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20),
                  filled: true,
                  fillColor: kGrey,
                  hintText: 'Card',
                  hintStyle: const TextStyle(
                    color: kSecondaryText,
                    fontSize: 16.0,
                  ),
                  focusColor: kSecondary,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              DropdownMenu(
                onSelected: (value) {
                  transactionType = value;
                  debugPrint(transactionType.toString());
                },
                label: const Text('Transaction type'),
                menuStyle: const MenuStyle(
                  backgroundColor: MaterialStatePropertyAll(kGrey),
                  surfaceTintColor: MaterialStatePropertyAll(kGrey),
                ),
                dropdownMenuEntries: const [
                  DropdownMenuEntry(
                    value: TransactionType.receiveOnly,
                    label: 'Recieving',
                  ),
                  DropdownMenuEntry(
                    value: TransactionType.receiveAndExchange,
                    label: 'Exchanging',
                  ),
                  DropdownMenuEntry(
                    value: TransactionType.send,
                    label: 'Sending',
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                onChanged: (value) {
                  amount = value;
                  debugPrint(amount);
                },
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
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                onChanged: (value) {
                  fees = value;
                  debugPrint(fees);
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
                ),
              ),
              const SizedBox(
                height: 250,
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<TransactionViewModel>(context, listen: false)
                      .addTransaction(
                    Transaction(
                      dateTime: DateTime.now(),
                      transactionType: transactionType!,
                      cardNumber: int.parse(cardNumber!),
                      transactionProfit: double.parse(fees!),
                      moneyAmount: int.parse(amount!),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmTransactionView(),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
