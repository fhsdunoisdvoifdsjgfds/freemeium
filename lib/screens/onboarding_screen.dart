import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/main_btn.dart';
import '../widgets/my_btn.dart';
import '../widgets/svgg.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30 + MediaQuery.of(context).viewPadding.top),
          Row(
            children: [
              const SizedBox(width: 28),
              _Indicator(isActive: index == 1),
              const SizedBox(width: 10),
              _Indicator(isActive: index == 2),
              const SizedBox(width: 10),
              _Indicator(isActive: index == 3),
              const SizedBox(width: 28),
            ],
          ),
          Expanded(
            child: index == 3
                ? const Svgg('assets/o3.svg')
                : Image.asset('assets/o$index.png'),
          ),
          Container(
            height: 306,
            color: const Color(0xff181818),
            child: Column(
              children: [
                const Spacer(),
                if (index == 1)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28),
                    child: Text(
                      'By tracking your expenses and income, you\'ll be able to plan your goals more effectively, whether it\'s saving for a holiday or education',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'w700',
                      ),
                    ),
                  )
                else ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Text(
                      index == 2
                          ? 'Become the master of income .'
                          : 'We value your feedback',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'w700',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      index == 2
                          ? 'In today\'s world, where financial literacy is becoming an integral part of life, managing your income and expenses is crucial.'
                          : 'Every review is valuable - it helps make our app better for you',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'w300',
                      ),
                    ),
                  ),
                ],
                const Spacer(),
                MainBtn(
                  title: 'Continue',
                  onPressed: () async {
                    if (index == 3) {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('onboarding', false);
                      if (context.mounted) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const HomeScreen();
                            },
                          ),
                          (route) => false,
                        );
                      }
                      // setState(() {
                      //   index--;
                      // });
                    } else {
                      setState(() {
                        index++;
                      });
                    }
                  },
                ),
                const SizedBox(height: 20),
                MyBtn(
                  onPressed: () {},
                  minSize: 20,
                  child: const Text(
                    'Terms of use  |  Privacy Policy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'w300',
                    ),
                  ),
                ),
                const SizedBox(height: 42),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 3,
        decoration: BoxDecoration(
          color: isActive
              ? const Color(0xff4FB84F)
              : Colors.white.withOpacity(0.33),
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
  }
}
