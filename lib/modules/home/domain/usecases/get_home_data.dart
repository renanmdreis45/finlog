import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../transactions/domain/entities/transaction.dart';
import '../entities/profile.dart';

class HomeData {
  final Profile profile;
  final double currentBalance;
  final List<Transaction> recentTransactions;

  HomeData({
    required this.profile,
    required this.currentBalance,
    required this.recentTransactions,
  });
}

class GetHomeData implements UseCase<HomeData, NoParams> {
  @override
  Future<Either<Failure, HomeData>> call(NoParams params) async {
    try {
      return Right(HomeData(
        profile: const Profile(
          id: '1',
          name: 'John Doe',
          photoUrl: null,
        ),
        currentBalance: 0.0,
        recentTransactions: const [],
      ));
    } catch (e) {
      return Left(ServerFailure(message: 'Profile not found!'));
    }
  }
}
