import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'nav_event.dart';
part 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  NavBloc() : super(NavInitial()) {
    on<NavEvent>(
      (event, emit) => switch (event) {
        ChangePage() => _changePage(event, emit),
      },
    );
  }

  void _changePage(
    ChangePage event,
    Emitter<NavState> emit,
  ) {
    if (event.i == 1) emit(NavInitial());
    if (event.i == 2) emit(NavIncome());
    if (event.i == 3) emit(NavNews());
    if (event.i == 4) emit(NavGame());
  }
}
