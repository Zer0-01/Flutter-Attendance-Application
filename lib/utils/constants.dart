class ActivityTypeConstant {
  static const String checkIn = "check in";
  static const String checkOut = "check out";
}

enum ActivityTypeEnum {
  checkIn(ActivityTypeConstant.checkIn),
  checkOut(ActivityTypeConstant.checkOut);

  final String value;
  const ActivityTypeEnum(this.value);
}
