part of 'nav_bloc.dart';

@immutable
sealed class NavState {}

final class NavInitial extends NavState {}

final class NavIncome extends NavState {}

final class NavNews extends NavState {}

final class NavGame extends NavState {}
