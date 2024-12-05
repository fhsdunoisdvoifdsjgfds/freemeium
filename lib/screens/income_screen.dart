import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cash/cash_bloc.dart';
import '../bloc/nav/nav_bloc.dart';
import '../utils.dart';
import '../models/cash.dart';
import '../widgets/category_button.dart';
import '../widgets/field_title.dart';
import '../widgets/main_btn.dart';
import '../widgets/text_title.dart';
import '../widgets/t_field.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({super.key});

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController(text: 'Dividends');

  bool isActive = false;

  void checkActive() {
    setState(() {
      isActive = controller1.text.isNotEmpty && controller2.text.isNotEmpty;
    });
  }

  void onAdd() {
    final cash = Cash(
      id: getTimestamp(),
      title: controller1.text,
      amount: int.parse(controller2.text),
      category: controller3.text,
    );
    context.read<CashBloc>().add(AddCash(cash: cash));
    context.read<NavBloc>().add(ChangePage(i: 1));
  }

  void onCategory(String value) {
    if (controller3.text == value) return;
    controller3.text = value;
    checkActive();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 34 + MediaQuery.of(context).viewPadding.top),
        const TextTitle('Income'),
        const SizedBox(height: 20),
        Row(
          children: [
            const SizedBox(width: 14),
            CategoryButton(
              title: 'Dividends',
              current: controller3.text,
              onPressed: () {
                onCategory('Dividends');
              },
            ),
            const SizedBox(width: 16),
            CategoryButton(
              title: 'Personal',
              current: controller3.text,
              onPressed: () {
                onCategory('Personal');
              },
            ),
            const SizedBox(width: 16),
            CategoryButton(
              title: 'Real estate',
              current: controller3.text,
              onPressed: () {
                onCategory('Real estate');
              },
            ),
            const SizedBox(width: 14),
          ],
        ),
        const SizedBox(height: 30),
        const Row(
          children: [
            SizedBox(width: 14),
            Text(
              'Add transactions',
              style: TextStyle(
                color: Color(0xff4FB84F),
                fontSize: 22,
                fontFamily: 'w500',
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const FieldTitle('Income description'),
        const SizedBox(height: 6),
        TField(
          controller: controller1,
          hintText: 'Title',
          onChanged: checkActive,
        ),
        const SizedBox(height: 20),
        const FieldTitle('Income Amount'),
        const SizedBox(height: 6),
        TField(
          controller: controller2,
          hintText: '\$5000',
          number: true,
          length: 6,
          onChanged: checkActive,
        ),
        const SizedBox(height: 10),
        MainBtn(
          title: 'Add income',
          isActive: isActive,
          onPressed: onAdd,
        ),
      ],
    );
  }
}
