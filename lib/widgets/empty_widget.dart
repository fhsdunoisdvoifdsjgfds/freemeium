import 'package:flutter/material.dart';

import 'svgg.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Svgg('assets/empty.svg'),
          SizedBox(height: 60),
          Text(
            'No information on income yet',
            style: TextStyle(
              color: Color(0xff4FB84F),
              fontSize: 22,
              fontFamily: 'w500',
            ),
          ),
        ],
      ),
    );
  }
}
