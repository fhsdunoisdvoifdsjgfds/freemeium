part of 'cash_bloc.dart';

@immutable
sealed class CashState {}

final class CashInitial extends CashState {}

final class CashLoaded extends CashState {
  CashLoaded({required this.cashes});
  final List<Cash> cashes;
}
