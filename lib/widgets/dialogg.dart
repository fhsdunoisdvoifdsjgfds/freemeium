import 'package:flutter/material.dart';

import 'my_btn.dart';

class Dialogg extends StatelessWidget {
  const Dialogg({
    super.key,
    required this.title,
    this.onlyClose = false,
    required this.onPressed,
  });

  final String title;
  final bool onlyClose;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: const Color(0xff1C1C1E),
      child: SizedBox(
        height: 150,
        width: 200,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontFamily: 'w700',
              ),
            ),
            const Spacer(),
            if (onlyClose)
              MyBtn(
                padding: 0,
                onPressed: () {
                  onPressed;
                  Navigator.pop(context);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Close',
                      style: TextStyle(
                        color: Color(0xff4FB84F),
                        fontSize: 16,
                        fontFamily: 'w600',
                      ),
                    ),
                  ],
                ),
              )
            else
              Row(
                children: [
                  const SizedBox(width: 20),
                  MyBtn(
                    padding: 0,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'NO',
                          style: TextStyle(
                            color: Color(0xff4FB84F),
                            fontSize: 16,
                            fontFamily: 'w600',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  MyBtn(
                    padding: 0,
                    onPressed: () {
                      Navigator.pop(context);
                      onPressed();
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'YES',
                          style: TextStyle(
                            color: Color(0xff4FB84F),
                            fontSize: 16,
                            fontFamily: 'w600',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
