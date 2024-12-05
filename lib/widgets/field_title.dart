import 'package:flutter/material.dart';

class FieldTitle extends StatelessWidget {
  const FieldTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 20),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: 'w300',
          ),
        ),
      ],
    );
  }
}
