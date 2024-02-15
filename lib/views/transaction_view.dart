import 'package:flutter/material.dart';
import 'package:katib_kashi/utils/constants.dart';
import 'package:katib_kashi/views/confirm_transaction_view.dart';
import 'package:katib_kashi/views/home_view.dart';
import 'package:katib_kashi/views/sign_up_view.dart';

class TransactionView extends StatefulWidget {
  const TransactionView({super.key});

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  List<String> buttons = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '',
    '0',
    'del'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: kPrimary,
          ),
        ),
        title: const Text(
          'Current Transaction',
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
      backgroundColor: kWhite,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              const DropdownMenu(
                menuStyle: MenuStyle(
                  backgroundColor: MaterialStatePropertyAll(kGrey),
                  surfaceTintColor: MaterialStatePropertyAll(kGrey),
                ),
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: 'value', label: 'Recived'),
                  DropdownMenuEntry(value: 'value', label: 'Send'),
                  DropdownMenuEntry(value: 'value', label: 'Exchange'),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20),
                  filled: true,
                  fillColor: kGrey,
                  hintText: 'Card',
                  hintStyle: const TextStyle(
                    color: kSecondaryText,
                    fontSize: 16.0,
                  ),
                  focusColor: kSecondary,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20),
                  filled: true,
                  fillColor: kGrey,
                  hintText: 'Amount',
                  hintStyle: const TextStyle(
                    color: kSecondaryText,
                    fontSize: 16.0,
                  ),
                  focusColor: kSecondary,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20),
                  filled: true,
                  fillColor: kGrey,
                  hintText: 'Transaction Fees',
                  hintStyle: const TextStyle(
                    color: kSecondaryText,
                    fontSize: 16.0,
                  ),
                  focusColor: kSecondary,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(
                height: 250,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmTransactionView(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kSecondary,
                  minimumSize: const Size.fromHeight(64),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: kWhite,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OldUI extends StatelessWidget {
  const OldUI({
    super.key,
    required this.buttons,
  });

  final List<String> buttons;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 300,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  width: 220,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.purple,
                      ],
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '5678',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: kWhite,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Money transfers from monzer card',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: kWhite,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '\$50320',
                  style: TextStyle(
                    fontSize: 52.0,
                    color: kWhite,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  'Maximum Is 100,000',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: kDark,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 400,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 90,
                    ),
                    itemBuilder: (context, index) {
                      final button = buttons[index];
                      if (button == 'del') {
                        return const Icon(Icons.backspace);
                      } else if (button == '') {
                        return const Text('');
                      }
                      return MyButton(
                        label: button,
                      );
                    },
                    itemCount: buttons.length,
                  ),
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (cotext) => ConfirmTransactionView(),
                      ),
                    );
                  },
                  child: Container(
                    height: 52,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: kSecondary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: kWhite,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          color: kDark,
          fontSize: 32,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
