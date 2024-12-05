import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_fi/screens/my_saving_screen.dart';

import '../bloc/saving/saving_bloc.dart';
import '../models/saving.dart';
import '../utils.dart';
import '../widgets/empty_widget.dart';
import '../widgets/my_btn.dart';
import '../widgets/svgg.dart';
import '../widgets/text_title.dart';

class MySavingsScreen extends StatelessWidget {
  const MySavingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top),
          const SizedBox(
            height: 60,
            child: TextTitle('My savings', back: true),
          ),
          BlocBuilder<SavingBloc, SavingState>(
            builder: (context, state) {
              if (state is SavingLoaded) {
                if (state.savings.isEmpty) {
                  return const EmptyWidget();
                }

                return Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    itemCount: state.savings.length,
                    itemBuilder: (context, index) {
                      return _SavingCard(saving: state.savings[index]);
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

class _SavingCard extends StatelessWidget {
  const _SavingCard({
    required this.saving,
  });

  final Saving saving;

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
                return MySavingScreen(saving: saving);
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
                color: const Color(0xff4FB84F).withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Svgg('assets/saving.svg'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    saving.category,
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
                        formatTimestamp(saving.id),
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
                            'Saving',
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
              '+${saving.amount} \$',
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
