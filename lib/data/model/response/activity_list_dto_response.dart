import 'package:json_annotation/json_annotation.dart';

part 'activity_list_dto_response.g.dart';

@JsonSerializable()
class ActivityListDtoResponse {
  final List<ActivityData> data;

  ActivityListDtoResponse({
    required this.data,
  });

  factory ActivityListDtoResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivityListDtoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityListDtoResponseToJson(this);
}

@JsonSerializable()
class ActivityData {
  final String type;
  final DateTime date;
  final String status;

  ActivityData({
    required this.type,
    required this.date,
    required this.status,
  });

  factory ActivityData.fromJson(Map<String, dynamic> json) =>
      _$ActivityDataFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityDataToJson(this);
}
