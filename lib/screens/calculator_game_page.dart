import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/cash/cash_bloc.dart';
import '../models/calc.dart';
import '../utils.dart';
import '../widgets/dialogg.dart';
import '../widgets/field_title.dart';
import '../widgets/main_btn.dart';
import '../widgets/score_card.dart';
import '../widgets/text_title.dart';
import '../widgets/t_field.dart';

class CalculatorGamePage extends StatefulWidget {
  const CalculatorGamePage({super.key});

  @override
  State<CalculatorGamePage> createState() => _CalculatorGamePageState();
}

class CalculatorEdit extends StatefulWidget {
  final String number;
  final String value;

  CalculatorEdit({
    required this.number,
    required this.value,
  });

  @override
  State<CalculatorEdit> createState() => _CalculatorEditState();
}

class _CalculatorEditState extends State<CalculatorEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse('${widget.number}${widget.value}'),
          ),
        ),
      ),
    );
  }
}

class _CalculatorGamePageState extends State<CalculatorGamePage> {
  final controller = TextEditingController();
  int index = 0;
  int correctAnswers = 0;

  void onCheck() async {
    final prefs = await SharedPreferences.getInstance();

    if (calcQuestions[index].answer == controller.text) {
      score += 10;
      correctAnswers++;
    } else {
      score -= 10;
    }
    controller.clear();
    await prefs.setInt('score', score);
    if (mounted) {
      context.read<CashBloc>().add(GetCash());
    }
    if (index == 19) {
      if (mounted) {
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return Dialogg(
              title: 'Correct: $correctAnswers',
              onlyClose: true,
              onPressed: () {},
            );
          },
        ).then((value) {
          setState(() {
            index = 0;
            correctAnswers = 0;
            calcQuestions.shuffle();
          });
        });
      }
    } else {
      setState(() {
        index++;
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    calcQuestions.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top),
          const SizedBox(
            height: 60,
            child: TextTitle('Speed Calculator', back: true),
          ),
          const SizedBox(height: 4),
          const ScoreCard(),
          const SizedBox(height: 15),
          Container(
            height: 188,
            margin: const EdgeInsets.symmetric(horizontal: 14),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xff1C1C1E),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: const Color(0xff4FB84F),
              ),
            ),
            child: Center(
              child: Text(
                calcQuestions[index].question,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontFamily: 'w700',
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          const FieldTitle('Enter your answer'),
          const SizedBox(height: 6),
          TField(
            controller: controller,
            hintText: '0',
            number: true,
            length: 3,
            onChanged: () {
              setState(() {});
            },
          ),
          const Spacer(),
          MainBtn(
            title: 'Check Answer',
            isActive: controller.text.isNotEmpty,
            onPressed: onCheck,
          ),
          const SizedBox(height: 96),
        ],
      ),
    );
  }
}
