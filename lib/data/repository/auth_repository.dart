import 'package:flutter_attendance_application/configuration/app_logger.dart';
import 'package:flutter_attendance_application/data/app_api_client.dart';
import 'package:flutter_attendance_application/data/model/request/sign_in_dto_request.dart';
import 'package:flutter_attendance_application/data/model/response/sign_in_dto_response.dart';
import 'package:flutter_attendance_application/env/env_dev.dart';

class AuthRepository {
  final AppLogger _logger = AppLogger.getLogger("AuthRepository");

  Future<SignInDtoResponse> postSignIn(
      {required SignInDtoRequest signInDtoRequest}) async {
    _logger.debug("postSignIn");

    final response = await AppApiClient()
        .post(EnvDev.endpointSignIn, signInDtoRequest.toJson());

    _logger.debug("response: $response");

    return SignInDtoResponse.fromJson(response ?? {});
  }
}
