import 'package:flutter/material.dart';

import '../models/answer.dart';
import 'my_btn.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.id,
    required this.current,
    required this.answer,
    required this.onPressed,
  });

  final String id;
  final Answer current;
  final Answer answer;
  final void Function(Answer) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: const Color(0xff4FB84F),
        ),
      ),
      child: MyBtn(
        onPressed: answer == current
            ? null
            : () {
                onPressed(answer);
              },
        child: Row(
          children: [
            const SizedBox(width: 14),
            Text(
              '$id.',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'w500',
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                answer.answer,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'w500',
                ),
              ),
            ),
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: answer == current ? const Color(0xff4FB84F) : null,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  width: 2,
                  color: const Color(0xffBDBDBD),
                ),
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
