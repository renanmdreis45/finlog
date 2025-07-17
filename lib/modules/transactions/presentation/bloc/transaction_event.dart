import 'package:equatable/equatable.dart';

import '../../domain/entities/transaction.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class GetTransactionsEvent extends TransactionEvent {}

class AddTransactionEvent extends TransactionEvent {
  final Transaction transaction;

  const AddTransactionEvent({required this.transaction});

  @override
  List<Object> get props => [transaction];
}

class UpdateTransactionEvent extends TransactionEvent {
  final Transaction transaction;

  const UpdateTransactionEvent({required this.transaction});

  @override
  List<Object> get props => [transaction];
}

class DeleteTransactionEvent extends TransactionEvent {
  final String id;

  const DeleteTransactionEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class GetTransactionsByPeriodEvent extends TransactionEvent {
  final DateTime start;
  final DateTime end;

  const GetTransactionsByPeriodEvent({
    required this.start,
    required this.end,
  });

  @override
  List<Object> get props => [start, end];
}

class GetTransactionsByCategoryEvent extends TransactionEvent {
  final String category;

  const GetTransactionsByCategoryEvent({required this.category});

  @override
  List<Object> get props => [category];
}
