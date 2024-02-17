import 'package:flutter/material.dart';
import 'package:katib_kashi/models/transaction.dart';
import 'package:katib_kashi/utils/constants.dart';
import 'package:katib_kashi/view_models/transation_view_model.dart';
import 'package:katib_kashi/views/transaction_view.dart';
import 'package:katib_kashi/views/transactions_view.dart';
import 'package:katib_kashi/views/widgets/custom_slider.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: kPrimary,
          ),
        ),
        title: const Text(
          'Home',
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: const CustomSlider()),
          SliverToBoxAdapter(
            child: const SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(child: ActionButtons()),
          SliverToBoxAdapter(child: const SizedBox(height: 16)),
          SliverToBoxAdapter(child: Section()),
          Consumer<TransactionViewModel>(
            builder: (context, model, child) {
              return SliverList.builder(
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
          ),
        ],
      ),
    );
  }
}

class Section extends StatelessWidget {
  const Section({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Recent Transactions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: false).push(
                MaterialPageRoute(
                  builder: (context) => TransactionsView(),
                ),
              );
            },
            child: const Text(
              'View all',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: kSecondary,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ActionButton(
            icon: Icons.arrow_upward,
            label: 'Send',
            transactionType: TransactionType.send,
          ),
          ActionButton(
            icon: Icons.arrow_downward,
            label: 'Recive',
            transactionType: TransactionType.receiveOnly,
          ),
          ActionButton(
            icon: Icons.swap_vert,
            label: 'Exchange',
            transactionType: TransactionType.receiveAndExchange,
          ),
          ActionButton(
            icon: Icons.more_horiz,
            label: 'More',
            transactionType: TransactionType.send,
          ),
        ],
      ),
    );
  }
}

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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TransactionView(
                    selectedTransaction: transactionType,
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
