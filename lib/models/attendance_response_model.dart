import 'dart:convert';

AttendanceResponseModel attendanceResponseModelFromJson(String str) =>
    AttendanceResponseModel.fromJson(json.decode(str));

String attendanceResponseModelToJson(AttendanceResponseModel data) =>
    json.encode(data.toJson());

class AttendanceResponseModel {
  final String id;
  final String name;
  final String date;

  AttendanceResponseModel(
      {required this.id, required this.name, required this.date});

  factory AttendanceResponseModel.fromJson(Map<String, dynamic> json) =>
      AttendanceResponseModel(
        id: json['id'],
        name: json['name'],
        date: json['date'],
      );

  Map<String, dynamic> toJson() => {"id": id, "name": name, "date": date};
}
