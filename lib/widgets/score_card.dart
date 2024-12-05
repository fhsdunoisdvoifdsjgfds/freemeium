import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cash/cash_bloc.dart';
import '../utils.dart';
import 'svgg.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xff1C1C1E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          const Svgg('assets/score.svg'),
          Expanded(
            child: Center(
              child: BlocBuilder<CashBloc, CashState>(
                builder: (context, state) {
                  return Text(
                    'Score: $score',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'w500',
                    ),
                  );
                },
              ),
            ),
          ),
          const Svgg('assets/score.svg'),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
