import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetCurrentBalance implements UseCase<double, NoParams> {
  GetCurrentBalance(Object object);

  @override
  Future<Either<Failure, double>> call(NoParams params) async {
    // TODO: Implement get current balance
    return const Right(0.0);
  }
}
