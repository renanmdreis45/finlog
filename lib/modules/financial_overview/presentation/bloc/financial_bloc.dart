import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_current_balance.dart';
import 'financial_event.dart';
import 'financial_state.dart';

class FinancialBloc extends Bloc<FinancialEvent, FinancialState> {
  final GetCurrentBalance getCurrentBalance;

  FinancialBloc({
    required this.getCurrentBalance,
  }) : super(FinancialInitial()) {
    on<GetCurrentBalanceEvent>(_onGetCurrentBalance);
  }

  Future<void> _onGetCurrentBalance(
    GetCurrentBalanceEvent event,
    Emitter<FinancialState> emit,
  ) async {
    emit(FinancialLoading());

    final result = await getCurrentBalance(NoParams());

    result.fold(
      (failure) => emit(FinancialError(message: failure.toString())),
      (balance) => emit(FinancialLoaded(currentBalance: balance)),
    );
  }
}
