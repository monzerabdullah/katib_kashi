import 'package:flutter/material.dart';
import 'package:katib_kashi/models/transaction.dart';
import 'package:katib_kashi/utils/constants.dart';
import 'package:katib_kashi/view_models/transation_view_model.dart';
import 'package:provider/provider.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: kPrimary,
            ),
          ),
          title: const Text(
            'Transactions',
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
          bottom: const TabBar(
            indicatorColor: kSecondary,
            indicatorWeight: 3,
            unselectedLabelColor: kDark,
            labelColor: kSecondary,
            labelStyle: TextStyle(
              fontSize: 16,
              color: kGrey,
              fontWeight: FontWeight.w600,
            ),
            tabs: [
              Tab(text: 'All Transactions'),
              Tab(text: 'Sends'),
              Tab(text: 'Recives'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AllTransactions(),
            SendingTransactions(),
            RecivesTransactions(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kSecondary,
          foregroundColor: kWhite,
          onPressed: () {},
          child: const Icon(
            Icons.show_chart,
          ),
        ),
      ),
    );
  }
}

class AllTransactions extends StatelessWidget {
  const AllTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionViewModel>(
      builder: (contex, model, child) {
        return ListView.builder(
          itemCount: model.allTranasctions.length,
          itemBuilder: (context, index) {
            final transaction = model.allTranasctions[index];
            return TransactionWidget(
              dateTime: transaction.dateTime,
              type: transaction.transactionType,
              amount: transaction.moneyAmount,
            );
          },
        );
      },
    );
  }
}

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({
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
    return InkWell(
      onTap: () {},
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
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
          'Monzer Abdullah',
          style: TextStyle(
            color: kDark,
            fontSize: 18.0,
          ),
        ),
        subtitle: Text(dateTime.toString(),
            style: TextStyle(
              color: Color(0xFFBDBDBD),
            )),
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

class SendingTransactions extends StatelessWidget {
  const SendingTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionViewModel>(
      builder: (contex, model, child) {
        final sendingTransactions = model.allTranasctions
            .where((tr) => tr.transactionType == TransactionType.send)
            .toList();
        return ListView.builder(
          itemCount: sendingTransactions.length,
          itemBuilder: (context, index) {
            final transaction = sendingTransactions[index];
            return TransactionWidget(
              dateTime: transaction.dateTime,
              type: transaction.transactionType,
              amount: transaction.moneyAmount,
            );
          },
        );
      },
    );
  }
}

class RecivesTransactions extends StatelessWidget {
  const RecivesTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionViewModel>(
      builder: (contex, model, child) {
        final recivesTransactions = model.allTranasctions
            .where((tr) => tr.transactionType != TransactionType.send)
            .toList();
        return ListView.builder(
          itemCount: recivesTransactions.length,
          itemBuilder: (context, index) {
            final transaction = recivesTransactions[index];
            return TransactionWidget(
              dateTime: transaction.dateTime,
              type: transaction.transactionType,
              amount: transaction.moneyAmount,
            );
          },
        );
      },
    );
  }
}
