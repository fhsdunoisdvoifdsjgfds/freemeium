part of 'saving_bloc.dart';

@immutable
sealed class SavingState {}

final class SavingInitial extends SavingState {}

final class SavingLoaded extends SavingState {
  SavingLoaded({required this.savings});
  final List<Saving> savings;
}
