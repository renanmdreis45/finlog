import 'package:equatable/equatable.dart';

import '../../../transactions/domain/entities/transaction.dart';
import '../../domain/entities/profile.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final Profile profile;
  final double currentBalance;
  final List<Transaction> recentTransactions;

  const HomeLoaded({
    required this.profile,
    required this.currentBalance,
    required this.recentTransactions,
  });

  @override
  List<Object> get props => [profile, currentBalance, recentTransactions];
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object> get props => [message];
}
