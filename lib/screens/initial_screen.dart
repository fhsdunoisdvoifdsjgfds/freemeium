import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../bloc/cash/cash_bloc.dart';
import '../bloc/saving/saving_bloc.dart';
import '../models/nw.dart';
import '../models/saving.dart';
import '../utils.dart';
import '../widgets/category_button.dart';
import '../widgets/my_btn.dart';
import '../widgets/svgg.dart';
import '../widgets/text_title.dart';
import 'history_screen.dart';
import 'my_saving_screen.dart';
import 'my_savings_screen.dart';
import 'news_read_screen.dart';
import 'task_manager_screen.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(height: 34 + MediaQuery.of(context).viewPadding.top),
        const TextTitle('Home'),
        const SizedBox(height: 20),
        const _BalanceCard(),
        const SizedBox(height: 20),
        Row(
          children: [
            const SizedBox(width: 14),
            CategoryButton(
              title: 'Transactions',
              current: 'Transactions',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const MySavingsScreen();
                    },
                  ),
                );
              },
            ),
            const SizedBox(width: 16),
            CategoryButton(
              title: 'My saving',
              current: 'My saving',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MySavingScreen(
                        saving: Saving(
                          id: 0,
                          category: '',
                          amount: 0,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(width: 16),
            CategoryButton(
              title: 'History',
              current: 'History',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HistoryScreen();
                    },
                  ),
                );
              },
            ),
            const SizedBox(width: 14),
          ],
        ),
        const SizedBox(height: 26),
        const TextTitle('Finance'),
        const SizedBox(height: 20),
        const Row(
          children: [
            SizedBox(width: 14),
            _TaskManagerCard(income: true),
            SizedBox(width: 30),
            _TaskManagerCard(),
            SizedBox(width: 14),
          ],
        ),
        const SizedBox(height: 20),
        const TextTitle('News'),
        const SizedBox(height: 20),
        ...List.generate(
          3,
          (index) {
            return _News(nw: nwLIST1[index]);
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      margin: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xff1C1C1E),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: const Color(0xff4FB84F),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 28),
                const Text(
                  'Current Balance',
                  style: TextStyle(
                    color: Color(0xff4FB84F),
                    fontSize: 22,
                    fontFamily: 'w500',
                  ),
                ),
                const SizedBox(height: 8),
                BlocBuilder<CashBloc, CashState>(
                  builder: (context, state) {
                    return BlocBuilder<SavingBloc, SavingState>(
                      builder: (context, state) {
                        return Text(
                          '\$ $currentBalance',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontFamily: 'w600',
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          const Svgg('assets/balance.svg'),
          const SizedBox(width: 30),
        ],
      ),
    );
  }
}

class _TaskManagerCard extends StatelessWidget {
  const _TaskManagerCard({
    this.income = false,
  });

  final bool income;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: const Color(0xff1C1C1E),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Row(
              children: [
                const SizedBox(width: 8),
                Container(
                  height: 32,
                  width: 36,
                  decoration: BoxDecoration(
                    color: const Color(0xff4FB84F).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child:
                        Svgg(income ? 'assets/task2.svg' : 'assets/task.svg'),
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  income ? 'Income' : 'Task\nmanager',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'w500',
                    height: 0.9,
                  ),
                ),
              ],
            ),
            SizedBox(height: income ? 6 : 12),
            Row(
              children: [
                const SizedBox(width: 14),
                if (income)
                  Text(
                    '\$ $totalIncomes',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'w700',
                    ),
                  )
                else
                  const Text(
                    'Make a budget',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'w700',
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const SizedBox(width: 14),
                if (income)
                  const Text(
                    'Total incomes',
                    style: TextStyle(
                      color: Color(0xff939393),
                      fontSize: 16,
                      fontFamily: 'w500',
                    ),
                  )
                else
                  const Expanded(
                    child: Text(
                      'record income and expenses.',
                      style: TextStyle(
                        color: Color(0xff939393),
                        fontSize: 12,
                        fontFamily: 'w500',
                      ),
                    ),
                  ),
                const SizedBox(width: 14),
              ],
            ),
            const Spacer(),
            _SeeAll(income),
            const SizedBox(height: 7),
          ],
        ),
      ),
    );
  }
}

class _SeeAll extends StatelessWidget {
  const _SeeAll(this.income);

  final bool income;

  @override
  Widget build(BuildContext context) {
    return MyBtn(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              if (income) return const HistoryScreen();
              return const TaskManagerScreen();
            },
          ),
        );
      },
      minSize: 28,
      child: Container(
        height: 28,
        width: 84,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: const Color(0xff4FB84F).withOpacity(0.2),
        ),
        child: const Center(
          child: Text(
            'See all',
            style: TextStyle(
              color: Color(0xff4FB84F),
              fontSize: 12,
              fontFamily: 'w500',
            ),
          ),
        ),
      ),
    );
  }
}

class _News extends StatelessWidget {
  const _News({
    required this.nw,
  });

  final NW nw;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: const EdgeInsets.only(
        bottom: 20,
        left: 14,
        right: 14,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff1C1C1E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: MyBtn(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return NewsReadScreen(nw: nw);
            },
          ));
        },
        child: Row(
          children: [
            const SizedBox(width: 5),
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: const Color(0xff4FB84F),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: nw.imageURL,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) {
                    return Container();
                  },
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    nw.title,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'w700',
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    nw.publishedDate,
                    style: const TextStyle(
                      color: Color(0xff939393),
                      fontSize: 10,
                      fontFamily: 'w500',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 40),
            const RotatedBox(
              quarterTurns: 2,
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: Color(0xff4FB84F),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
