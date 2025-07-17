import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/add_transaction.dart';
import '../../domain/usecases/get_transactions.dart';
import 'transaction_event.dart';
import 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final GetTransactions getTransactions;
  final AddTransaction addTransaction;

  TransactionBloc({
    required this.getTransactions,
    required this.addTransaction,
  }) : super(TransactionInitial()) {
    on<GetTransactionsEvent>(_onGetTransactions);
    on<AddTransactionEvent>(_onAddTransaction);
  }

  Future<void> _onGetTransactions(
    GetTransactionsEvent event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TransactionLoading());

    final result = await getTransactions(NoParams());

    result.fold(
      (failure) => emit(TransactionError(message: failure.toString())),
      (transactions) => emit(TransactionsLoaded(transactions: transactions)),
    );
  }

  Future<void> _onAddTransaction(
    AddTransactionEvent event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TransactionLoading());

    final result = await addTransaction(event.transaction);

    result.fold(
      (failure) => emit(TransactionError(message: failure.toString())),
      (transaction) => emit(TransactionAdded(transaction: transaction)),
    );
  }
}
