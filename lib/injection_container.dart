import 'package:finlog/features/financial/domain/usecases/get_current_balance.dart';
import 'package:finlog/features/financial/presentation/bloc/financial_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC
  sl.registerFactory(
    () => FinancialBloc(
      getCurrentBalance: sl(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetCurrentBalance(sl()));

}
