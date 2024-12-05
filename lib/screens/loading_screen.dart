import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cash/cash_bloc.dart';
import '../utils.dart';
import 'home_screen.dart';
import 'onboarding_screen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CashBloc, CashState>(
        listener: (context, state) {
          if (state is CashLoaded) {
            Future.delayed(
              const Duration(seconds: 2),
              () {
                if (context.mounted) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        if (onboarding) return const OnboardingScreen();
                        return const HomeScreen();
                      },
                    ),
                    (route) => false,
                  );
                }
              },
            );
          }
        },
        builder: (context, state) {
          return const Center(
            child: CupertinoActivityIndicator(
              color: Colors.white,
              radius: 14,
            ),
          );
        },
      ),
    );
  }
}
