import 'package:flutter/material.dart';
import 'package:katib_kashi/models/transaction.dart';
import 'package:katib_kashi/utils/constants.dart';
import 'package:katib_kashi/views/transaction_view.dart';
import 'package:katib_kashi/views/widgets/custom_slider.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.transactionType,
  });
  final IconData icon;
  final String label;
  final TransactionType transactionType;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 62,
          height: 62,
          child: IconButton.filled(
            color: kSecondary,
            iconSize: 35,
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(kGrey),
            ),
            onPressed: () {
              // debugPrint('$selectedCardNumber');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TransactionView(
                    selectedTransaction: transactionType,
                    selectedCardNumber: selectedCardNumber,
                  ),
                ),
              );
            },
            icon: Icon(
              icon,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
