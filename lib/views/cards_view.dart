import 'package:flutter/material.dart';
import 'package:katib_kashi/utils/constants.dart';
import 'package:katib_kashi/views/add_new_card_view.dart';
import 'package:katib_kashi/views/widgets/custom_slider.dart';

class CardsView extends StatelessWidget {
  const CardsView({super.key});

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
          'Cards',
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSlider(),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'This Week',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              color: kGrey,
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: LimitSelector(),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: LimitSelector(),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Lock Card',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: kDark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Switch(
                    value: true,
                    activeColor: kSecondary,
                    onChanged: (newValue) {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewCardView(),
            ),
          );
        },
        backgroundColor: kSecondary,
        foregroundColor: kWhite,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class LimitSelector extends StatelessWidget {
  const LimitSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daiily Limit',
              style: TextStyle(
                fontSize: 18.0,
                color: kDark,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '20.000',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[400],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Slider(
          label: '120',
          value: 120,
          min: 0,
          max: 20000.0,
          onChanged: (newValue) {},
          thumbColor: kSecondary,
        )
      ],
    );
  }
}
