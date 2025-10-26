// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_dto_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInDtoRequest _$SignInDtoRequestFromJson(Map<String, dynamic> json) =>
    SignInDtoRequest(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SignInDtoRequestToJson(SignInDtoRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
