import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class FinancialRepository {
  Future<Either<Failure, double>> getCurrentBalance();
}
