import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cash/cash_bloc.dart';
import '../models/cash.dart';
import '../utils.dart';
import '../widgets/empty_widget.dart';
import '../widgets/my_btn.dart';
import '../widgets/text_title.dart';
import 'edit_income_screen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top),
          const SizedBox(
            height: 60,
            child: TextTitle('History', back: true),
          ),
          BlocBuilder<CashBloc, CashState>(
            builder: (context, state) {
              if (state is CashLoaded) {
                if (state.cashes.isEmpty) {
                  return const EmptyWidget();
                }

                return Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    itemCount: state.cashes.length,
                    itemBuilder: (context, index) {
                      return _CashCard(cash: state.cashes[index]);
                    },
                  ),
                );
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}

class _CashCard extends StatelessWidget {
  const _CashCard({
    required this.cash,
  });

  final Cash cash;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: const EdgeInsets.only(
        bottom: 26,
        left: 14,
        right: 14,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff1C1C1E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: MyBtn(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return EditIncomeScreen(cash: cash);
              },
            ),
          );
        },
        child: Row(
          children: [
            const SizedBox(width: 5),
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: const Color(0xff4FB84F),
                ),
                image: const DecorationImage(
                  image: AssetImage('assets/income.png'),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cash.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'w700',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        formatTimestamp(cash.id),
                        style: const TextStyle(
                          color: Color(0xff939393),
                          fontSize: 10,
                          fontFamily: 'w500',
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        height: 16,
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xff4FB84F).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Center(
                          child: Text(
                            'Income',
                            style: TextStyle(
                              color: Color(0xff4FB84F),
                              fontSize: 10,
                              fontFamily: 'w500',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            Text(
              '+${cash.amount} \$',
              style: const TextStyle(
                color: Color(0xff4FB84F),
                fontSize: 12,
                fontFamily: 'w700',
              ),
            ),
            const SizedBox(width: 30),
          ],
        ),
      ),
    );
  }
}
