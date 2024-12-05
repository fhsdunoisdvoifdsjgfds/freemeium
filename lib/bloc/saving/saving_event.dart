part of 'saving_bloc.dart';

@immutable
sealed class SavingEvent {}

class GetSaving extends SavingEvent {}

class AddSaving extends SavingEvent {
  AddSaving({required this.saving});
  final Saving saving;
}

class EditSaving extends SavingEvent {
  EditSaving({required this.saving});
  final Saving saving;
}

class DeleteSaving extends SavingEvent {
  DeleteSaving({required this.saving});
  final Saving saving;
}
