import 'package:finlog/modules/financial_overview/domain/usecases/get_current_balance.dart';
import 'package:finlog/modules/financial_overview/presentation/bloc/financial_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => FinancialBloc(
      getCurrentBalance: sl(),
    ),
  );

  sl.registerLazySingleton(() => GetCurrentBalance(sl()));

}
