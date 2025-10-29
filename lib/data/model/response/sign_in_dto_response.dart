import 'package:json_annotation/json_annotation.dart';

part 'sign_in_dto_response.g.dart';

@JsonSerializable()
class SignInDtoResponse {
  final SignInToken token;

  SignInDtoResponse({
    required this.token,
  });

  factory SignInDtoResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInDtoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInDtoResponseToJson(this);
}

@JsonSerializable()
class SignInToken {
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @JsonKey(name: 'token_type')
  final String tokenType;
  @JsonKey(name: 'expires_in')
  final int expiresIn;

  SignInToken({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.expiresIn,
  });

  factory SignInToken.fromJson(Map<String, dynamic> json) =>
      _$SignInTokenFromJson(json);

  Map<String, dynamic> toJson() => _$SignInTokenToJson(this);
}
