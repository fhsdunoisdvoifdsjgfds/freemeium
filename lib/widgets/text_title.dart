import 'package:flutter/material.dart';

import 'my_btn.dart';

class TextTitle extends StatelessWidget {
  const TextTitle(
    this.title, {
    super.key,
    this.back = false,
    this.onDelete,
  });

  final String title;
  final bool back;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (back) ...[
          const SizedBox(width: 10),
          MyBtn(
            onPressed: () {
              Navigator.pop(context);
            },
            minSize: 26,
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Color(0xff4FB84F),
            ),
          ),
        ],
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontFamily: 'w600',
            ),
          ),
        ),
        if (onDelete != null) ...[
          MyBtn(
            onPressed: onDelete,
            minSize: 26,
            child: const Icon(
              Icons.delete,
              color: Color(0xff4FB84F),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ],
    );
  }
}
