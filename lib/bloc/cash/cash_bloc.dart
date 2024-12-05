import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../db.dart';
import '../../models/cash.dart';

part 'cash_event.dart';
part 'cash_state.dart';

class CashBloc extends Bloc<CashEvent, CashState> {
  final _database = Db();

  CashBloc() : super(CashInitial()) {
    on<CashEvent>(
      (event, emit) => switch (event) {
        GetCash() => _getCashes(event, emit),
        AddCash() => _addCash(event, emit),
        EditCash() => _editCash(event, emit),
        DeleteCash() => _deleteCash(event, emit),
      },
    );
  }

  void _getCashes(GetCash event, Emitter<CashState> emit) async {
    await _database.init();
    List<Cash> cashes = await _database.getCashes();
    emit(CashLoaded(cashes: cashes));
  }

  void _addCash(AddCash event, Emitter<CashState> emit) async {
    List<Cash> cashes = await _database.addCash(event.cash);
    emit(CashLoaded(cashes: cashes));
  }

  void _editCash(EditCash event, Emitter<CashState> emit) async {
    List<Cash> cashes = await _database.editCash(event.cash);
    emit(CashLoaded(cashes: cashes));
  }

  void _deleteCash(DeleteCash event, Emitter<CashState> emit) async {
    List<Cash> cashes = await _database.deleteCash(event.cash);
    emit(CashLoaded(cashes: cashes));
  }
}
