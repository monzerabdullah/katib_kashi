import 'package:flutter/material.dart';
import 'package:katib_kashi/main.dart';
import 'package:katib_kashi/models/transaction.dart';
import 'package:katib_kashi/utils/constants.dart';
import 'package:katib_kashi/view_models/cards_view_model.dart';
import 'package:katib_kashi/view_models/transation_view_model.dart';
import 'package:katib_kashi/views/statistics_view.dart';
import 'package:katib_kashi/views/transaction_details_view.dart';
import 'package:katib_kashi/views/widgets/tabs/all_transactions_list.dart';
import 'package:katib_kashi/views/widgets/tabs/reciving_transactions_list.dart';
import 'package:katib_kashi/views/widgets/tabs/sending_transactions_list.dart';
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
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MyApp()),
              );
            },
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
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const StatisticsView(),
            ));
          },
          child: const Icon(
            Icons.show_chart,
          ),
        ),
      ),
    );
  }
}
