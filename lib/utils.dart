import 'package:intl/intl.dart';

double navbarHeight = 86;
bool onboarding = true;
int score = 0;
int totalIncomes = 0;
int currentBalance = 0;

int getTimestamp() => DateTime.now().millisecondsSinceEpoch ~/ 1000;

String formatTimestamp(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  final now = DateTime.now();
  final timeFormatter = DateFormat('h:mm a');
  final dateFormatter = DateFormat('d MMMM');
  if (date.year == now.year && date.month == now.month && date.day == now.day) {
    return 'Today, ${timeFormatter.format(date)}';
  } else {
    return '${dateFormatter.format(date)}, ${timeFormatter.format(date)}';
  }
}
