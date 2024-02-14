import 'package:flutter/material.dart';
import 'package:katib_kashi/utils/constants.dart';

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
    return ListView(
      children: const [
        Transaction(),
        Transaction(),
        Transaction(),
        Transaction(),
        Transaction(),
        Transaction(),
        Transaction(),
        Transaction(),
        Transaction(),
        Transaction(),
        Transaction(),
        Transaction(),
        Transaction(),
      ],
    );
  }
}

class Transaction extends StatelessWidget {
  const Transaction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: CircleAvatar(
          radius: 32,
          child: Icon(Icons.arrow_outward),
        ),
        title: Text(
          'Monzer Abdullah',
          style: TextStyle(
            color: kDark,
            fontSize: 18.0,
          ),
        ),
        subtitle: Text('3:45 PM • Feb 22,2024',
            style: TextStyle(
              color: Color(0xFFBDBDBD),
            )),
        trailing: Text(
          '12.00 EGP',
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
    return const Placeholder();
  }
}

class RecivesTransactions extends StatelessWidget {
  const RecivesTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
