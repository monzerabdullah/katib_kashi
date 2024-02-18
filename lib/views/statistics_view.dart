import 'package:flutter/material.dart';
import 'package:katib_kashi/utils/constants.dart';
import 'package:katib_kashi/view_models/transation_view_model.dart';
import 'package:percent_indicator/percent_indicator.dart';
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
            DayStatistics(),
            DayStatistics(),
            DayStatistics(),
            DayStatistics(),
          ],
        ),
      ),
    );
  }
}

class DayStatistics extends StatelessWidget {
  const DayStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StatisticalData(
                  progressColor: Color(0xFF00E194),
                  icon: Icons.arrow_drop_down,
                  label: 'Income',
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatisticalData(
                  progressColor: Color(0xFFFF4891),
                  icon: Icons.arrow_drop_up,
                  label: 'Sent',
                ),
                SizedBox(
                  width: 10,
                ),
                StatisticalData(
                  progressColor: kSecondary,
                  icon: Icons.arrow_drop_down,
                  label: 'Recived',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StatisticalData extends StatelessWidget {
  const StatisticalData({
    super.key,
    required this.progressColor,
    required this.icon,
    required this.label,
  });

  final Color progressColor;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    double? percentage;

    percentage = (Provider.of<TransactionViewModel>(context).sent() +
            Provider.of<TransactionViewModel>(context).recived()) /
        Provider.of<TransactionViewModel>(context).income() /
        10;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularPercentIndicator(
          animation: true,
          radius: 40,
          progressColor: progressColor,
          backgroundColor: const Color(0xFFDAE1F6),
          center: Icon(
            icon,
            color: progressColor,
            size: 35,
          ),
          percent: percentage!,
        ),
        const SizedBox(width: 20),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey[500],
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '${Provider.of<TransactionViewModel>(context).income()}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
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
