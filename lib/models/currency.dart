import 'answer.dart';

class Currency {
  Currency({
    required this.currency,
    required this.answers,
  });

  final String currency;
  final List<Answer> answers;
}

List<Currency> currencies = [
  Currency(currency: '\$', answers: [
    Answer(answer: 'Dollar', isCorrect: true),
    Answer(answer: 'Euro', isCorrect: false),
    Answer(answer: 'Peso', isCorrect: false),
    Answer(answer: 'Yuan', isCorrect: false),
  ]),
  Currency(currency: '€', answers: [
    Answer(answer: 'Euro', isCorrect: true),
    Answer(answer: 'Dollar', isCorrect: false),
    Answer(answer: 'Rupee', isCorrect: false),
    Answer(answer: 'Yen', isCorrect: false),
  ]),
  Currency(currency: '¥', answers: [
    Answer(answer: 'Yen', isCorrect: true),
    Answer(answer: 'Peso', isCorrect: false),
    Answer(answer: 'Won', isCorrect: false),
    Answer(answer: 'Ringgit', isCorrect: false),
  ]),
  Currency(currency: '£', answers: [
    Answer(answer: 'Pound', isCorrect: true),
    Answer(answer: 'Dollar', isCorrect: false),
    Answer(answer: 'Euro', isCorrect: false),
    Answer(answer: 'Ruble', isCorrect: false),
  ]),
  Currency(currency: '₹', answers: [
    Answer(answer: 'Rupee', isCorrect: true),
    Answer(answer: 'Yen', isCorrect: false),
    Answer(answer: 'Rial', isCorrect: false),
    Answer(answer: 'Taka', isCorrect: false),
  ]),
  Currency(currency: '₽', answers: [
    Answer(answer: 'Ruble', isCorrect: true),
    Answer(answer: 'Pound', isCorrect: false),
    Answer(answer: 'Peso', isCorrect: false),
    Answer(answer: 'Dollar', isCorrect: false),
  ]),
  Currency(currency: '₩', answers: [
    Answer(answer: 'Won', isCorrect: true),
    Answer(answer: 'Yuan', isCorrect: false),
    Answer(answer: 'Rupee', isCorrect: false),
    Answer(answer: 'Dollar', isCorrect: false),
  ]),
  Currency(currency: '₺', answers: [
    Answer(answer: 'Lira', isCorrect: true),
    Answer(answer: 'Euro', isCorrect: false),
    Answer(answer: 'Rial', isCorrect: false),
    Answer(answer: 'Pound', isCorrect: false),
  ]),
  Currency(currency: '₦', answers: [
    Answer(answer: 'Naira', isCorrect: true),
    Answer(answer: 'Dollar', isCorrect: false),
    Answer(answer: 'Rupee', isCorrect: false),
    Answer(answer: 'Taka', isCorrect: false),
  ]),
  Currency(currency: '฿', answers: [
    Answer(answer: 'Baht', isCorrect: true),
    Answer(answer: 'Peso', isCorrect: false),
    Answer(answer: 'Ringgit', isCorrect: false),
    Answer(answer: 'Won', isCorrect: false),
  ]),
  Currency(currency: '₫', answers: [
    Answer(answer: 'Dong', isCorrect: true),
    Answer(answer: 'Rupee', isCorrect: false),
    Answer(answer: 'Yen', isCorrect: false),
    Answer(answer: 'Peso', isCorrect: false),
  ]),
  Currency(currency: '₲', answers: [
    Answer(answer: 'Guarani', isCorrect: true),
    Answer(answer: 'Dollar', isCorrect: false),
    Answer(answer: 'Euro', isCorrect: false),
    Answer(answer: 'Peso', isCorrect: false),
  ]),
  Currency(currency: '₪', answers: [
    Answer(answer: 'Shekel', isCorrect: true),
    Answer(answer: 'Rupee', isCorrect: false),
    Answer(answer: 'Baht', isCorrect: false),
    Answer(answer: 'Won', isCorrect: false),
  ]),
  Currency(currency: '₴', answers: [
    Answer(answer: 'Hryvnia', isCorrect: true),
    Answer(answer: 'Pound', isCorrect: false),
    Answer(answer: 'Ruble', isCorrect: false),
    Answer(answer: 'Yuan', isCorrect: false),
  ]),
  Currency(currency: '₡', answers: [
    Answer(answer: 'Colón', isCorrect: true),
    Answer(answer: 'Peso', isCorrect: false),
    Answer(answer: 'Yuan', isCorrect: false),
    Answer(answer: 'Baht', isCorrect: false),
  ]),
  Currency(currency: 'ƒ', answers: [
    Answer(answer: 'Florin', isCorrect: true),
    Answer(answer: 'Dollar', isCorrect: false),
    Answer(answer: 'Euro', isCorrect: false),
    Answer(answer: 'Pound', isCorrect: false),
  ]),
  Currency(currency: '₭', answers: [
    Answer(answer: 'Kip', isCorrect: true),
    Answer(answer: 'Dong', isCorrect: false),
    Answer(answer: 'Yen', isCorrect: false),
    Answer(answer: 'Taka', isCorrect: false),
  ]),
  Currency(currency: '₮', answers: [
    Answer(answer: 'Tugrik', isCorrect: true),
    Answer(answer: 'Rupee', isCorrect: false),
    Answer(answer: 'Rial', isCorrect: false),
    Answer(answer: 'Dollar', isCorrect: false),
  ]),
  Currency(currency: '₦', answers: [
    Answer(answer: 'Kwanza', isCorrect: true),
    Answer(answer: 'Lira', isCorrect: false),
    Answer(answer: 'Rial', isCorrect: false),
    Answer(answer: 'Dong', isCorrect: false),
  ]),
  Currency(currency: '₿', answers: [
    Answer(answer: 'Bitcoin', isCorrect: true),
    Answer(answer: 'Dollar', isCorrect: false),
    Answer(answer: 'Euro', isCorrect: false),
    Answer(answer: 'Pound', isCorrect: false),
  ]),
];
