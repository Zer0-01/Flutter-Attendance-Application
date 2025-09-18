import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_attendance_application/configuration/app_logger.dart';
import 'package:flutter_attendance_application/data/model/response/activity_list_dto_response.dart';
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

  Future<void> _onInitHomeEvent(
      OnInitHomeEvent event, Emitter<HomeState> emit) async {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      add(OnTickHomeEvent(dateTime: DateTime.now()));
    });

    await _getActivityList(emit);
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

  Future<void> _getActivityList(Emitter<HomeState> emit) async {
    _logger.debug("getActivityList");

    try {
      emit(
          state.copyWith(getActivityListStatus: GetActivityListStatus.loading));

      final ActivityListDtoResponse activityListDtoResponse =
          ActivityListDtoResponse(
        data: [
          ActivityData(
            type: "check in",
            date: DateTime.now().subtract(const Duration(hours: 2)),
            status: "ontime",
          ),
          ActivityData(
            type: "check out",
            date: DateTime.now().subtract(const Duration(hours: 1)),
            status: "late",
          ),
          ActivityData(
            type: "check in",
            date: DateTime.now().subtract(const Duration(days: 1, hours: 3)),
            status: "late",
          ),
          ActivityData(
            type: "check out",
            date: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
            status: "ontime",
          ),
          ActivityData(
            type: "check in",
            date: DateTime.now().subtract(const Duration(days: 2, hours: 2)),
            status: "ontime",
          ),
        ],
      );

      final List<ActivityData> activityList = activityListDtoResponse.data;

      emit(
        state.copyWith(
          getActivityListStatus: GetActivityListStatus.success,
          activityList: activityList,
        ),
      );
    } catch (e) {
      _logger.error(e.toString());
      emit(
          state.copyWith(getActivityListStatus: GetActivityListStatus.failure));
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
