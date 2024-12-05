import 'answer.dart';

class MathQuiz {
  MathQuiz({
    required this.question,
    required this.answers,
  });

  final String question;
  final List<Answer> answers;
}

List<MathQuiz> mathQuizes = [
  MathQuiz(
    question: 'What is 5 + 3?',
    answers: [
      Answer(answer: '8', isCorrect: true),
      Answer(answer: '6', isCorrect: false),
      Answer(answer: '9', isCorrect: false),
      Answer(answer: '7', isCorrect: false),
    ],
  ),
  MathQuiz(
    question: 'What is 12 - 7?',
    answers: [
      Answer(answer: '5', isCorrect: true),
      Answer(answer: '6', isCorrect: false),
      Answer(answer: '4', isCorrect: false),
      Answer(answer: '3', isCorrect: false),
    ],
  ),
  MathQuiz(
    question: 'What is 6 × 4?',
    answers: [
      Answer(answer: '24', isCorrect: true),
      Answer(answer: '20', isCorrect: false),
      Answer(answer: '22', isCorrect: false),
      Answer(answer: '18', isCorrect: false),
    ],
  ),
  MathQuiz(
    question: 'What is 81 ÷ 9?',
    answers: [
      Answer(answer: '9', isCorrect: true),
      Answer(answer: '8', isCorrect: false),
      Answer(answer: '7', isCorrect: false),
      Answer(answer: '10', isCorrect: false),
    ],
  ),
  MathQuiz(
    question: 'What is the square root of 64?',
    answers: [
      Answer(answer: '8', isCorrect: true),
      Answer(answer: '7', isCorrect: false),
      Answer(answer: '6', isCorrect: false),
      Answer(answer: '9', isCorrect: false),
    ],
  ),
  MathQuiz(
    question: 'What is 15 + 27?',
    answers: [
      Answer(answer: '42', isCorrect: true),
      Answer(answer: '40', isCorrect: false),
      Answer(answer: '41', isCorrect: false),
      Answer(answer: '39', isCorrect: false),
    ],
  ),
  MathQuiz(
    question: 'What is 100 - 55?',
    answers: [
      Answer(answer: '45', isCorrect: true),
      Answer(answer: '50', isCorrect: false),
      Answer(answer: '40', isCorrect: false),
      Answer(answer: '60', isCorrect: false),
    ],
  ),
  MathQuiz(
    question: 'What is 7 × 8?',
    answers: [
      Answer(answer: '56', isCorrect: true),
      Answer(answer: '49', isCorrect: false),
      Answer(answer: '48', isCorrect: false),
      Answer(answer: '64', isCorrect: false),
    ],
  ),
  MathQuiz(
    question: 'What is 144 ÷ 12?',
    answers: [
      Answer(answer: '12', isCorrect: true),
      Answer(answer: '10', isCorrect: false),
      Answer(answer: '11', isCorrect: false),
      Answer(answer: '14', isCorrect: false),
    ],
  ),
  MathQuiz(
    question: 'What is the value of π (pi) rounded to 2 decimal places?',
    answers: [
      Answer(answer: '3.14', isCorrect: true),
      Answer(answer: '3.15', isCorrect: false),
      Answer(answer: '3.13', isCorrect: false),
      Answer(answer: '3.12', isCorrect: false),
    ],
  ),
  MathQuiz(
    question: 'What is 9²?',
    answers: [
      Answer(answer: '81', isCorrect: true),
      Answer(answer: '72', isCorrect: false),
      Answer(answer: '64', isCorrect: false),
      Answer(answer: '90', isCorrect: false),
    ],
  ),
  MathQuiz(
    question: 'What is the cube of 3?',
    answers: [
      Answer(answer: '27', isCorrect: true),
      Answer(answer: '9', isCorrect: false),
      Answer(answer: '18', isCorrect: false),
      Answer(answer: '24', isCorrect: false),
    ],
  ),
  MathQuiz(
    question: 'What is the result of 10 ÷ 2?',
    answers: [
      Answer(answer: '5', isCorrect: true),
      Answer(answer: '4', isCorrect: false),
      Answer(answer: '6', isCorrect: false),
      Answer(answer: '8', isCorrect: false),
    ],
  ),
  MathQuiz(
    question: 'What is the perimeter of a square with a side length of 5?',
    answers: [
      Answer(answer: '20', isCorrect: true),
      Answer(answer: '25', isCorrect: false),
      Answer(answer: '15', isCorrect: false),
      Answer(answer: '30', isCorrect: false),
    ],
  ),
  MathQuiz(
    question: 'What is 50% of 200?',
    answers: [
      Answer(answer: '100', isCorrect: true),
      Answer(answer: '50', isCorrect: false),
      Answer(answer: '150', isCorrect: false),
      Answer(answer: '200', isCorrect: false),
    ],
  ),
  MathQuiz(
    question: 'What is 3 × (4 + 5)?',
    answers: [
      Answer(answer: '27', isCorrect: true),
      Answer(answer: '24', isCorrect: false),
      Answer(answer: '12', isCorrect: false),
      Answer(answer: '36', isCorrect: false),
    ],
  ),
  MathQuiz(
    question: 'What is 10³?',
    answers: [
      Answer(answer: '1000', isCorrect: true),
      Answer(answer: '100', isCorrect: false),
      Answer(answer: '300', isCorrect: false),
      Answer(answer: '10', isCorrect: false),
    ],
  ),
  MathQuiz(
    question: 'What is 1/4 of 16?',
    answers: [
      Answer(answer: '4', isCorrect: true),
      Answer(answer: '8', isCorrect: false),
      Answer(answer: '2', isCorrect: false),
      Answer(answer: '6', isCorrect: false),
    ],
  ),
  MathQuiz(
    question: 'What is the value of 7²?',
    answers: [
      Answer(answer: '49', isCorrect: true),
      Answer(answer: '42', isCorrect: false),
      Answer(answer: '56', isCorrect: false),
      Answer(answer: '36', isCorrect: false),
    ],
  ),
  MathQuiz(
    question: 'What is the result of 15 × 3?',
    answers: [
      Answer(answer: '45', isCorrect: true),
      Answer(answer: '30', isCorrect: false),
      Answer(answer: '50', isCorrect: false),
      Answer(answer: '60', isCorrect: false),
    ],
  ),
];
