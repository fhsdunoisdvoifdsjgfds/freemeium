import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cash/cash_bloc.dart';
import '../models/cash.dart';
import '../widgets/category_button.dart';
import '../widgets/dialogg.dart';
import '../widgets/field_title.dart';
import '../widgets/main_btn.dart';
import '../widgets/text_title.dart';
import '../widgets/t_field.dart';

class EditIncomeScreen extends StatefulWidget {
  const EditIncomeScreen({
    super.key,
    required this.cash,
  });

  final Cash cash;

  @override
  State<EditIncomeScreen> createState() => _EditIncomeScreenState();
}

class _EditIncomeScreenState extends State<EditIncomeScreen> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController(text: 'Dividends');

  bool isActive = true;

  void checkActive() {
    setState(() {
      isActive = controller1.text.isNotEmpty && controller2.text.isNotEmpty;
    });
  }

  void onEdit() {
    final cash = Cash(
      id: widget.cash.id,
      title: controller1.text,
      amount: int.parse(controller2.text),
      category: controller3.text,
    );
    context.read<CashBloc>().add(EditCash(cash: cash));
    Navigator.pop(context);
  }

  void onCategory(String value) {
    if (controller3.text == value) return;
    controller3.text = value;
    checkActive();
  }

  void onDelete() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialogg(
          title: 'Delete Income?',
          onPressed: () {
            context.read<CashBloc>().add(DeleteCash(cash: widget.cash));
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    controller1.text = widget.cash.title;
    controller2.text = widget.cash.amount.toString();
    controller3.text = widget.cash.category;
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
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top),
          SizedBox(
            height: 60,
            child: TextTitle(
              'Income',
              back: true,
              onDelete: onDelete,
            ),
          ),
          const SizedBox(height: 4),
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
                'Edit transactions',
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
            title: 'Edit income',
            isActive: isActive,
            onPressed: onEdit,
          ),
        ],
      ),
    );
  }
}
