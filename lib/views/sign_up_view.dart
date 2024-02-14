import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:katib_kashi/utils/constants.dart';
import 'package:katib_kashi/views/home_view.dart';
import 'package:katib_kashi/views/sign_in_view.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height + 150,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 360,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    SvgPicture.asset(
                      'assets/svgs/logo.svg',
                    ),
                    const Text(
                      'Bash Katib',
                      style: TextStyle(
                        fontSize: 48.0,
                        color: kWhite,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      'PERSONAL BANKING APP',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: kWhite,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Let\'s start with Sign Up!',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: kWhite,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
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
                      const SizedBox(height: 25),
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20),
                          filled: true,
                          fillColor: kGrey,
                          hintText: 'Full Name',
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
                        height: 20,
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
                        height: 20,
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomeView(),
                            ),
                          );
                        },
                        child: Container(
                          height: 62,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: kSecondary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'SIGN UP',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: kWhite,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'You Already have an Account? ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: kDark,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const SignInView(),
                                ),
                              );
                            },
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: kSecondary,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
