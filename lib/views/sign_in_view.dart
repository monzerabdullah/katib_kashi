import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:katib_kashi/main.dart';
import 'package:katib_kashi/utils/constants.dart';
import 'package:katib_kashi/views/home_view.dart';
import 'package:katib_kashi/views/sign_up_view.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              SvgPicture.asset(
                'assets/svgs/logo.svg',
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Sign in to\nKatib Kashi.',
                style: TextStyle(
                  fontSize: 24.0,
                  color: kDark,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: 136,
                height: 7,
                decoration: BoxDecoration(
                  color: kSecondary,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20),
                  filled: true,
                  fillColor: kGrey,
                  hintText: 'Email Address',
                  hintStyle: const TextStyle(
                    color: kSecondaryText,
                    fontSize: 16.0,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20),
                  filled: true,
                  fillColor: kGrey,
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                    color: kSecondaryText,
                    fontSize: 16.0,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Remember me',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: kDark,
                    ),
                  ),
                  Switch(
                    value: true,
                    activeColor: kSecondary,
                    onChanged: (newValue) {},
                  )
                ],
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const MyApp(),
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
                  'SIGN IN',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: kWhite,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'You Don\'t have an Account? ',
                    style: TextStyle(
                      fontSize: 16,
                      color: kDark,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SignUpView(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: kSecondary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
