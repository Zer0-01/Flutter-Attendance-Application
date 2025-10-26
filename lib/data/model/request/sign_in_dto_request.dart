import 'package:json_annotation/json_annotation.dart';

part 'sign_in_dto_request.g.dart';

@JsonSerializable()
class SignInDtoRequest {
  final String username;
  final String password;

  SignInDtoRequest({
    required this.username,
    required this.password,
  });

  factory SignInDtoRequest.fromJson(Map<String, dynamic> json) =>
      _$SignInDtoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignInDtoRequestToJson(this);
}
