import 'package:flutter/material.dart';
import 'package:katib_kashi/main.dart';
import 'package:katib_kashi/utils/constants.dart';

class ConfirmTransactionView extends StatelessWidget {
  const ConfirmTransactionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                kPrimary,
                kSecondary,
                Colors.greenAccent,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 120,
              ),
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kSecondary,
                ),
                child: const Icon(
                  Icons.check,
                  color: kWhite,
                  size: 45,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                width: 300,
                child: Text(
                  'Transaction Has Been Saved!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: kWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Your transaction is now saved to data base \nso you can check it later.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: kGrey,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 62,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 1.5,
                        color: kWhite,
                      ),
                    ),
                    child: const Text(
                      'Back To Home',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: kWhite,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OldUi extends StatelessWidget {
  const OldUi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 300,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                width: 220,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.purple,
                    ],
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  '5678',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: kWhite,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Money transfers from monzer card',
                style: TextStyle(
                  fontSize: 20.0,
                  color: kWhite,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '\$50320',
                style: TextStyle(
                  fontSize: 52.0,
                  color: kWhite,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
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
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Confirm Transaction',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 60),
                const TransactionSideTile(),
                const SizedBox(
                  height: 30,
                ),
                const TransactionSideTile(),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 52,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: kSecondary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Save Transaction',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: kWhite,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TransactionSideTile extends StatelessWidget {
  const TransactionSideTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kGrey,
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.purple,
                ],
              ),
            ),
            alignment: Alignment.center,
            child: const Text(
              '5321',
              style: TextStyle(
                fontSize: 24,
                color: kWhite,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sender',
                style: TextStyle(
                  fontSize: 18,
                  color: kSecondaryText,
                ),
              ),
              Text(
                'Monzer abdullah ahmed',
                style: TextStyle(
                  fontSize: 18,
                  color: kDark,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
