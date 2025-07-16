import 'package:finlog/core/usecases/usecase.dart';
import 'package:finlog/features/financial/domain/usecases/get_current_balance.dart';
import 'package:finlog/features/financial/presentation/bloc/financial_event.dart';
import 'package:finlog/features/financial/presentation/bloc/financial_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      (failure) => emit(FinancialError(message: failure.message)),
      (balance) => emit(FinancialLoaded(currentBalance: balance)),
    );
  }
}
