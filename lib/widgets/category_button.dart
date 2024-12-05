import 'package:flutter/material.dart';

import 'my_btn.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    required this.title,
    required this.current,
    required this.onPressed,
  });

  final String title;
  final String current;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MyBtn(
        onPressed: onPressed,
        minSize: 26,
        child: Container(
          height: 26,
          decoration: BoxDecoration(
            color: title == current
                ? const Color(0xff4FB84F)
                : const Color(0xff045433),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: title == current ? Colors.white : Colors.black,
                fontSize: 16,
                fontFamily: 'w500',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
