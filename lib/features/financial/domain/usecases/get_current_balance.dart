import 'package:dartz/dartz.dart';
import 'package:finlog/core/error/failures.dart';
import 'package:finlog/core/usecases/usecase.dart';
import 'package:finlog/features/financial/domain/repositories/financial_repository.dart';

class GetCurrentBalance implements UseCase<double, NoParams> {
  final FinancialRepository repository;

  GetCurrentBalance(this.repository);

  @override
  Future<Either<Failure, double>> call(NoParams params) async {
    return await repository.getCurrentBalance();
  }
}
