// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_list_dto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityListDtoResponse _$ActivityListDtoResponseFromJson(
        Map<String, dynamic> json) =>
    ActivityListDtoResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => ActivityData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActivityListDtoResponseToJson(
        ActivityListDtoResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ActivityData _$ActivityDataFromJson(Map<String, dynamic> json) => ActivityData(
      type: json['type'] as String,
      date: DateTime.parse(json['date'] as String),
      status: json['status'] as String,
    );

Map<String, dynamic> _$ActivityDataToJson(ActivityData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'date': instance.date.toIso8601String(),
      'status': instance.status,
    };
