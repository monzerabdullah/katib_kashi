import 'package:flutter/material.dart';
import 'package:katib_kashi/utils/constants.dart';
import 'package:katib_kashi/view_models/cards_view_model.dart';
import 'package:katib_kashi/view_models/transation_view_model.dart';
import 'package:katib_kashi/views/cards_view.dart';
import 'package:katib_kashi/views/home_view.dart';
import 'package:katib_kashi/views/sign_in_view.dart';
import 'package:katib_kashi/views/sign_up_view.dart';
import 'package:katib_kashi/views/transactions_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TransactionViewModel()),
        ChangeNotifierProvider(create: (context) => CardsViewModel())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Katib Kashi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: views[currentPageIndex],
        bottomNavigationBar: NavigationBarTheme(
          data: const NavigationBarThemeData(
            labelTextStyle: MaterialStatePropertyAll(
              TextStyle(color: kWhite),
            ),
          ),
          child: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            backgroundColor: kPrimary,
            indicatorColor: kIndicatorColor,
            selectedIndex: currentPageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.home,
                  color: kWhite,
                ),
                icon: Icon(
                  Icons.home_outlined,
                  color: kWhite,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.list,
                  color: kWhite,
                ),
                label: 'Transactions',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.credit_card,
                  color: kWhite,
                ),
                label: 'Cards',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.settings,
                  color: kWhite,
                ),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> views = [
  HomeView(),
  TransactionsView(),
  CardsView(),
  SettingsView(),
];

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
