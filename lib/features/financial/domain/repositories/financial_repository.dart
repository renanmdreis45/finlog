import 'package:dartz/dartz.dart';
import 'package:finlog/core/error/failures.dart';
import 'package:finlog/features/financial/domain/entities/transaction.dart';

abstract class FinancialRepository {
  Future<Either<Failure, List<Transaction>>> getTransactions();
  Future<Either<Failure, Transaction>> addTransaction(Transaction transaction);
  Future<Either<Failure, double>> getCurrentBalance();
  Future<Either<Failure, void>> deleteTransaction(String id);
  Future<Either<Failure, Transaction>> updateTransaction(
      Transaction transaction);
}
