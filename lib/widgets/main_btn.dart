import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainBtn extends StatelessWidget {
  const MainBtn({
    super.key,
    required this.title,
    this.isActive = true,
    required this.onPressed,
  });

  final String title;
  final bool isActive;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xff4FB84F) : const Color(0xff045433),
        borderRadius: BorderRadius.circular(14),
      ),
      child: CupertinoButton(
        onPressed: isActive ? onPressed : null,
        padding: EdgeInsets.zero,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'w500',
            ),
          ),
        ),
      ),
    );
  }
}
