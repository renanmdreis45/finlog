import 'package:equatable/equatable.dart';

abstract class FinancialState extends Equatable {
  const FinancialState();

  @override
  List<Object> get props => [];
}

class FinancialInitial extends FinancialState {}

class FinancialLoading extends FinancialState {}

class FinancialLoaded extends FinancialState {
  final double currentBalance;

  const FinancialLoaded({required this.currentBalance});

  @override
  List<Object> get props => [currentBalance];
}

class FinancialError extends FinancialState {
  final String message;

  const FinancialError({required this.message});

  @override
  List<Object> get props => [message];
}
