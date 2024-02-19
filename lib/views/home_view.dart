import 'package:flutter/material.dart';
import 'package:katib_kashi/models/transaction.dart';
import 'package:katib_kashi/utils/constants.dart';
import 'package:katib_kashi/view_models/cards_view_model.dart';
import 'package:katib_kashi/view_models/transation_view_model.dart';
import 'package:katib_kashi/views/transaction_view.dart';
import 'package:katib_kashi/views/transactions_view.dart';
import 'package:katib_kashi/views/widgets/action_buttons.dart';
import 'package:katib_kashi/views/widgets/custom_slider.dart';
import 'package:katib_kashi/views/widgets/section.dart';
import 'package:katib_kashi/views/widgets/starter_banner.dart';
import 'package:katib_kashi/views/widgets/transaction_custom_widget.dart';
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
          Provider.of<CardsViewModel>(context).allCards.isEmpty
              ? const SliverToBoxAdapter(
                  child: StarterBanner(),
                )
              : const SliverToBoxAdapter(
                  child: CustomSlider(),
                ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          const SliverToBoxAdapter(child: ActionButtons()),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          const SliverToBoxAdapter(child: Section()),
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
                    cardNumber: transaction.cardNumber,
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
