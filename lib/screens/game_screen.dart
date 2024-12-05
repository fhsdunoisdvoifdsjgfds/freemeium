import 'package:flutter/material.dart';

import '../widgets/my_btn.dart';
import '../widgets/score_card.dart';
import '../widgets/svgg.dart';
import '../widgets/text_title.dart';
import 'calculator_game_page.dart';
import 'currency_game_screen.dart';
import 'math_game_page.dart';
import 'puzzle_game_page.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(height: 22 + MediaQuery.of(context).viewPadding.top),
        const TextTitle('Choose a game'),
        const SizedBox(height: 22),
        const ScoreCard(),
        const SizedBox(height: 18),
        const _Game(
          title: 'Speed calculator',
          description: '20 maths examples',
          info: 'Solve maths examples and win',
          color: Color(0xff011020),
          borderColor: Color(0xff0261CA),
          page: CalculatorGamePage(),
        ),
        const SizedBox(height: 12),
        const _Game(
          title: 'Maths quiz',
          description: '20 questions about maths',
          info: 'Answer the toughest questions and become a maths guru',
          color: Color(0xff1D1101),
          borderColor: Color(0xffFF9500),
          page: MathGamePage(),
        ),
        const SizedBox(height: 12),
        const _Game(
          title: 'Currency expert',
          description: 'Guess 20 currencies',
          info:
              'Guess the most popular currencies and be an expert on the topic of finance',
          color: Color(0xff081C0D),
          borderColor: Color(0xff34C759),
          page: CurrencyGameScreen(),
        ),
        const SizedBox(height: 12),
        const _Game(
          title: 'The puzzle master',
          description: '20 beautiful puzzles',
          info: 'Show your attentiveness and solve beautiful puzzles ',
          color: Color(0xff180C1F),
          borderColor: Color(0xffAF52DE),
          page: PuzzleGamePage(),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

class _Game extends StatelessWidget {
  const _Game({
    required this.title,
    required this.description,
    required this.info,
    required this.color,
    required this.borderColor,
    required this.page,
  });

  final String title;
  final String description;
  final String info;
  final Color color;
  final Color borderColor;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 123,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 1,
          color: borderColor,
        ),
      ),
      child: MyBtn(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return page;
              },
            ),
          );
        },
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: borderColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Svgg(
                          'assets/game.svg',
                          color: borderColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 26),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'w700',
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          description,
                          style: const TextStyle(
                            color: Color(0xff939393),
                            fontSize: 12,
                            fontFamily: 'w500',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Text(
                    info,
                    style: const TextStyle(
                      color: Color(0xff939393),
                      fontSize: 12,
                      fontFamily: 'w500',
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 18,
              right: 4,
              child: RotatedBox(
                quarterTurns: 2,
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: borderColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
