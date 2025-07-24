import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/financial_repository.dart';

class GetCurrentBalance implements UseCase<double, NoParams> {
  final FinancialRepository repository;

  GetCurrentBalance(this.repository);

  @override
  Future<Either<Failure, double>> call(NoParams params) async {
    return await repository.getCurrentBalance();
  }
}
