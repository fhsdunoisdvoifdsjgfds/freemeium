part of 'cash_bloc.dart';

@immutable
sealed class CashEvent {}

class GetCash extends CashEvent {}

class AddCash extends CashEvent {
  AddCash({required this.cash});
  final Cash cash;
}

class EditCash extends CashEvent {
  EditCash({required this.cash});
  final Cash cash;
}

class DeleteCash extends CashEvent {
  DeleteCash({required this.cash});
  final Cash cash;
}
