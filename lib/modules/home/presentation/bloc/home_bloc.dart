import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_home_data.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeData getHomeData;

  HomeBloc({
    required this.getHomeData,
  }) : super(HomeInitial()) {
    on<LoadHomeDataEvent>(_onLoadHomeData);
  }

  Future<void> _onLoadHomeData(
    LoadHomeDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());

    final result = await getHomeData(NoParams());

    result.fold(
      (failure) => emit(HomeError(message: failure.toString())),
      (data) => emit(HomeLoaded(
        profile: data.profile,
        currentBalance: data.currentBalance,
        recentTransactions: data.recentTransactions,
      )),
    );
  }
}
