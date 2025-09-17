part of 'home_bloc.dart';

class HomeState extends Equatable {
  final String hour;
  final String minute;
  final String second;

  const HomeState({
    this.hour = "00",
    this.minute = "00",
    this.second = "00",
  });

  HomeState copyWith({
    String? hour,
    String? minute,
    String? second,
  }) {
    return HomeState(
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      second: second ?? this.second,
    );
  }

  @override
  List<Object> get props => [
        hour,
        minute,
        second,
      ];
}
