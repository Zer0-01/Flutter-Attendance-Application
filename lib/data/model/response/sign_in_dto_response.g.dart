// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_dto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInDtoResponse _$SignInDtoResponseFromJson(Map<String, dynamic> json) =>
    SignInDtoResponse(
      token: SignInToken.fromJson(json['token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignInDtoResponseToJson(SignInDtoResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

SignInToken _$SignInTokenFromJson(Map<String, dynamic> json) => SignInToken(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      tokenType: json['token_type'] as String,
      expiresIn: (json['expires_in'] as num).toInt(),
    );

Map<String, dynamic> _$SignInTokenToJson(SignInToken instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
    };
