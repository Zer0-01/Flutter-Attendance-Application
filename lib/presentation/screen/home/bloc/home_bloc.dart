import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_attendance_application/configuration/app_logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AppLogger _logger = AppLogger.getLogger("HomeBloc");
  Timer? _timer;

  HomeBloc() : super(const HomeState()) {
    on<OnInitHomeEvent>(_onInitHomeEvent);
    on<OnTickHomeEvent>(_onTickHomeEvent);
  }

  void _onInitHomeEvent(OnInitHomeEvent event, Emitter<HomeState> emit) {
    // Cancel existing timer if any
    _timer?.cancel();

    // Start ticking every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      add(OnTickHomeEvent(dateTime: DateTime.now()));
    });
  }

  void _onTickHomeEvent(OnTickHomeEvent event, Emitter<HomeState> emit) {
    final dt = event.dateTime;
    emit(
      state.copyWith(
        hour: dt.hour.toString().padLeft(2, '0'),
        minute: dt.minute.toString().padLeft(2, '0'),
        second: dt.second.toString().padLeft(2, '0'),
      ),
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
