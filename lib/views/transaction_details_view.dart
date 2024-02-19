import 'package:flutter/material.dart';
import 'package:katib_kashi/models/transaction.dart';
import 'package:katib_kashi/utils/constants.dart';

class TransactionDetailsView extends StatelessWidget {
  const TransactionDetailsView({
    super.key,
    required this.dateTime,
    required this.amount,
    required this.type,
  });

  final DateTime dateTime;
  final int amount;
  final TransactionType type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kPrimary,
          ),
        ),
        title: const Text(
          'Transaction Details',
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
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 80,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 30,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: kPrimary,
              width: 1.5,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transaction Type',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: kSecondary.withOpacity(.8),
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    '${type == TransactionType.send ? 'Sending' : 'Recive'}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: kDark,
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transaction Amount',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: kSecondary.withOpacity(.8),
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    '$amount',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: kDark,
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transaction Fee',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: kSecondary.withOpacity(.8),
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    '30',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: kDark,
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transaction Time',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: kSecondary.withOpacity(.8),
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    '${dateTime.hour}:${dateTime.minute},${dateTime.day}/${dateTime.month}/${dateTime.year}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: kDark,
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Card',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: kSecondary.withOpacity(.8),
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    '3300',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: kDark,
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
