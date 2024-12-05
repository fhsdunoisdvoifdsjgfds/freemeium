import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../db.dart';
import '../../models/saving.dart';

part 'saving_event.dart';
part 'saving_state.dart';

class SavingBloc extends Bloc<SavingEvent, SavingState> {
  final _database = Db();

  SavingBloc() : super(SavingInitial()) {
    on<SavingEvent>(
      (event, emit) => switch (event) {
        GetSaving() => _getSavings(event, emit),
        AddSaving() => _addSaving(event, emit),
        EditSaving() => _editSaving(event, emit),
        DeleteSaving() => _deleteSaving(event, emit),
      },
    );
  }

  void _getSavings(GetSaving event, Emitter<SavingState> emit) async {
    await _database.init();
    List<Saving> savings = await _database.getSavings();
    emit(SavingLoaded(savings: savings));
  }

  void _addSaving(AddSaving event, Emitter<SavingState> emit) async {
    List<Saving> savings = await _database.addSaving(event.saving);
    emit(SavingLoaded(savings: savings));
  }

  void _editSaving(EditSaving event, Emitter<SavingState> emit) async {
    List<Saving> savings = await _database.editSaving(event.saving);
    emit(SavingLoaded(savings: savings));
  }

  void _deleteSaving(DeleteSaving event, Emitter<SavingState> emit) async {
    List<Saving> savings = await _database.deleteSaving(event.saving);
    emit(SavingLoaded(savings: savings));
  }
}
