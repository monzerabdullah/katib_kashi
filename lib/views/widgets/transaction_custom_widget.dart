import 'package:flutter/material.dart';
import 'package:katib_kashi/models/transaction.dart';
import 'package:katib_kashi/utils/constants.dart';
import 'package:katib_kashi/view_models/cards_view_model.dart';
import 'package:katib_kashi/views/transaction_details_view.dart';
import 'package:provider/provider.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({
    super.key,
    required this.dateTime,
    required this.amount,
    required this.type,
    required this.cardNumber,
  });

  final DateTime dateTime;
  final int amount;
  final TransactionType type;
  final int cardNumber;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TransactionDetailsView(
              dateTime: dateTime,
              amount: amount,
              type: type,
            ),
          ),
        );
      },
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: CircleAvatar(
          radius: 32,
          child: Icon(
            type == TransactionType.send
                ? Icons.arrow_upward
                : Icons.arrow_downward,
            color: kSecondary,
          ),
          backgroundColor: kGrey,
        ),
        title: Text(
          Provider.of<CardsViewModel>(context)
              .allCards
              .singleWhere((card) => card.cardNumber == cardNumber)
              .cardOwnerName,
          style: TextStyle(
            color: kDark,
            fontSize: 18.0,
          ),
        ),
        subtitle: Text(
          '${dateTime.hour}:${dateTime.minute} ${dateTime.hashCode >= 12 ? 'PM' : 'AM'} • ${dateTime.month} ${dateTime.day},${dateTime.year}',
          style: TextStyle(
            color: Color(0xFFBDBDBD),
            fontSize: 14,
          ),
        ),
        trailing: Text(
          '$amount EGP',
          style: TextStyle(
            color: kDark,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
