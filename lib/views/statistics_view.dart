import 'package:flutter/material.dart';
import 'package:katib_kashi/utils/constants.dart';
import 'package:katib_kashi/view_models/transation_view_model.dart';
import 'package:provider/provider.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: kWhite,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: kPrimary,
              ),
            ),
            title: const Text(
              'Statistics',
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
                Tab(text: 'Day'),
                Tab(text: 'Week'),
                Tab(text: 'Month'),
                Tab(text: 'Year'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              StatisticsRow(),
              StatisticsRow(),
              StatisticsRow(),
              StatisticsRow(),
            ],
          )),
    );
  }
}

class StatisticsRow extends StatelessWidget {
  const StatisticsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              child: Icon(
                Icons.insert_chart_rounded,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Income'),
                SizedBox(height: 5),
                Text(
                  '${Provider.of<TransactionViewModel>(context).income()}',
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              child: Icon(
                Icons.insert_chart_rounded,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Sent'),
                SizedBox(height: 5),
                Text(
                  '${Provider.of<TransactionViewModel>(context).sent()}',
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              child: Icon(
                Icons.insert_chart_rounded,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Recived'),
                SizedBox(height: 5),
                Text(
                  '${Provider.of<TransactionViewModel>(context).recived()}',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
