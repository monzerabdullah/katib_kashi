import 'package:flutter/material.dart';
import 'package:katib_kashi/utils/constants.dart';
import 'package:katib_kashi/views/widgets/custom_slider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
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
      body: Column(
        children: [
          const CustomSlider(),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(
                  icon: Icons.arrow_circle_up,
                  label: 'Send',
                ),
                ActionButton(
                  icon: Icons.arrow_circle_down,
                  label: 'Recive',
                ),
                ActionButton(
                  icon: Icons.swap_vertical_circle_outlined,
                  label: 'Exchange',
                ),
                ActionButton(
                  icon: Icons.more_horiz,
                  label: 'More',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
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
                  onPressed: () {},
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
          )
        ],
      ),
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
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
  });
  final IconData icon;
  final String label;
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
            onPressed: () {},
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
