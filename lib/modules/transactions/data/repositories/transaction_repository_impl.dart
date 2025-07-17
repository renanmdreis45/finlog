import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../datasources/transaction_datasource.dart';
import '../models/transaction_model.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionDataSource dataSource;

  TransactionRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<Transaction>>> getTransactions() async {
    try {
      final transactions = await dataSource.getTransactions();
      return Right(transactions);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, Transaction>> addTransaction(
      Transaction transaction) async {
    try {
      final transactionModel = TransactionModel.fromEntity(transaction);
      final result = await dataSource.addTransaction(transactionModel);
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, Transaction>> updateTransaction(
      Transaction transaction) async {
    try {
      final transactionModel = TransactionModel.fromEntity(transaction);
      final result = await dataSource.updateTransaction(transactionModel);
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteTransaction(String id) async {
    try {
      await dataSource.deleteTransaction(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<Transaction>>> getTransactionsByPeriod(
    DateTime start,
    DateTime end,
  ) async {
    try {
      final transactions = await dataSource.getTransactionsByPeriod(start, end);
      return Right(transactions);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<Transaction>>> getTransactionsByCategory(
    String category,
  ) async {
    try {
      final transactions = await dataSource.getTransactionsByCategory(category);
      return Right(transactions);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }
}
