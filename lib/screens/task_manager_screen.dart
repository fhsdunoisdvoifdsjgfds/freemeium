import 'package:flutter/material.dart';
import 'package:green_fi/widgets/main_btn.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/my_btn.dart';
import '../widgets/text_title.dart';

class TaskManagerScreen extends StatefulWidget {
  const TaskManagerScreen({super.key});

  @override
  State<TaskManagerScreen> createState() => _TaskManagerScreenState();
}

class _TaskManagerScreenState extends State<TaskManagerScreen> {
  final Map<String, bool> tasks = {
    'task1': false,
    'task2': false,
    'task3': false,
    'task4': false,
    'task5': false,
    'task6': false,
    'task7': false,
    'task8': false,
    'task9': false,
    'task10': false,
    'task11': false,
    'task12': false,
  };

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  void getTasks() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      for (final key in tasks.keys) {
        tasks[key] = prefs.getBool(key) ?? false;
      }
    });
  }

  void saveTask(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  void onTask(int value) {
    final taskKey = 'task$value';

    if (tasks.containsKey(taskKey)) {
      setState(() {
        tasks[taskKey] = !tasks[taskKey]!;
        saveTask(taskKey, tasks[taskKey]!);
      });
    }
  }

  bool getTaskValue(int id) {
    return tasks['task$id'] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top),
          const SizedBox(
            height: 60,
            child: TextTitle('Task manager', back: true),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 14),
              children: [
                _Card(
                  title: 'Beginner level',
                  children: [
                    _Tile(
                      id: 1,
                      title: 'Define financial goals',
                      description: 'short, medium and long term.',
                      isActive: getTaskValue(1),
                      onPressed: onTask,
                    ),
                    _Tile(
                      id: 2,
                      title: 'Make a budget',
                      description: 'record income and expenses.',
                      isActive: getTaskValue(2),
                      onPressed: onTask,
                    ),
                    _Tile(
                      id: 3,
                      title: 'Create an emergency fund',
                      description:
                          'save an amount equal to 3-6 months of your expenses.',
                      isActive: getTaskValue(3),
                      onPressed: onTask,
                    ),
                    _Tile(
                      id: 4,
                      title: 'Avoid debt',
                      description:
                          'try to live within your means and pay for your purchases immediately.',
                      isActive: getTaskValue(4),
                      onPressed: onTask,
                    ),
                  ],
                ),
                const SizedBox(height: 26),
                _Card(
                  title: 'Advance level',
                  children: [
                    _Tile(
                      id: 5,
                      title: 'Invest in your education',
                      description:
                          'skills and knowledge are the best investments.',
                      isActive: getTaskValue(5),
                      onPressed: onTask,
                    ),
                    _Tile(
                      id: 6,
                      title: 'Use financial tools',
                      description:
                          'familiarise yourself with banking products and investments.',
                      isActive: getTaskValue(6),
                      onPressed: onTask,
                    ),
                    _Tile(
                      id: 7,
                      title: 'Evaluate your spending',
                      description: 'regularly review what you can cut back on.',
                      isActive: getTaskValue(7),
                      onPressed: onTask,
                    ),
                    _Tile(
                      id: 8,
                      title: 'Plan for major purchases',
                      description: 'put money aside in advance.',
                      isActive: getTaskValue(8),
                      onPressed: onTask,
                    ),
                  ],
                ),
                const SizedBox(height: 26),
                _Card(
                  title: 'Professional level',
                  children: [
                    _Tile(
                      id: 9,
                      title: 'Be tax-conscious',
                      description: 'research what tax deductions you can get.',
                      isActive: getTaskValue(9),
                      onPressed: onTask,
                    ),
                    _Tile(
                      id: 10,
                      title: 'Develop financial intelligence',
                      description: 'participate in webinars and seminars.',
                      isActive: getTaskValue(10),
                      onPressed: onTask,
                    ),
                    _Tile(
                      id: 11,
                      title: 'Discuss finances with your family',
                      description: 'talk openly about money with loved ones.',
                      isActive: getTaskValue(11),
                      onPressed: onTask,
                    ),
                    _Tile(
                      id: 12,
                      title: 'Set new financial challenges',
                      description: 'step out of your comfort zone.',
                      isActive: getTaskValue(12),
                      onPressed: onTask,
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                MainBtn(
                  title: 'Accept',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 22),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 256,
      margin: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xff1C1C1E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 14),
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xff4FB84F),
                  fontSize: 22,
                  fontFamily: 'w500',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.id,
    required this.title,
    required this.description,
    required this.isActive,
    required this.onPressed,
  });

  final int id;
  final String title;
  final String description;
  final bool isActive;
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: MyBtn(
        onPressed: () {
          onPressed(id);
        },
        child: Row(
          children: [
            const SizedBox(width: 20),
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: isActive ? const Color(0xff4FB84F) : null,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  width: 2,
                  color: const Color(0xffBDBDBD),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'w700',
                    ),
                  ),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xff939393),
                      fontSize: 12,
                      fontFamily: 'w500',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
