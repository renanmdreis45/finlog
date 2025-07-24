import 'package:dartz/dartz.dart';
import 'package:finlog/core/usecases/usecase.dart';
import 'package:finlog/modules/financial_overview/domain/repositories/financial_repository.dart';
import 'package:finlog/modules/financial_overview/domain/usecases/get_current_balance.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_current_balance_test.mocks.dart';

@GenerateMocks([FinancialRepository])
void main() {
  late GetCurrentBalance usecase;
  late MockFinancialRepository mockRepository;

  setUp(() {
    mockRepository = MockFinancialRepository();
    usecase = GetCurrentBalance(mockRepository);
  });

  const testBalance = 1000.0;

  test(
    'should get current balance from the repository',
    () async {
      when(mockRepository.getCurrentBalance())
          .thenAnswer((_) async => const Right(testBalance));

      final result = await usecase(NoParams());

      expect(result, const Right(testBalance));
      verify(mockRepository.getCurrentBalance());
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
