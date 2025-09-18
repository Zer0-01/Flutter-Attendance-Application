part of 'home_bloc.dart';

enum GetActivityListStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final GetActivityListStatus getActivityListStatus;
  final String hour;
  final String minute;
  final String second;
  final List<ActivityData> activityList;

  const HomeState({
    this.getActivityListStatus = GetActivityListStatus.initial,
    this.hour = "00",
    this.minute = "00",
    this.second = "00",
    this.activityList = const [],
  });

  HomeState copyWith({
    GetActivityListStatus? getActivityListStatus,
    String? hour,
    String? minute,
    String? second,
    List<ActivityData>? activityList,
  }) {
    return HomeState(
      getActivityListStatus:
          getActivityListStatus ?? this.getActivityListStatus,
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      second: second ?? this.second,
      activityList: activityList ?? this.activityList,
    );
  }

  @override
  List<Object> get props => [
        getActivityListStatus,
        hour,
        minute,
        second,
        activityList,
      ];
}
