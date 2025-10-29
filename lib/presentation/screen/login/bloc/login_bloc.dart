import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_attendance_application/configuration/app_logger.dart';
import 'package:flutter_attendance_application/configuration/app_secure_storage.dart';
import 'package:flutter_attendance_application/data/model/request/sign_in_dto_request.dart';
import 'package:flutter_attendance_application/data/model/response/sign_in_dto_response.dart';
import 'package:flutter_attendance_application/data/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AppLogger _logger = AppLogger.getLogger("LoginBloc");
  late final AuthRepository _authRepository;
  late final AppSecureStorage _appSecureStorage;

  LoginBloc(
      {required AuthRepository authRepository,
      required AppSecureStorage appSecureStorage})
      : _authRepository = authRepository,
        _appSecureStorage = appSecureStorage,
        super(const LoginState()) {
    on<OnPressedLoginEvent>(_onPressedLoginEvent);
  }

  Future<void> _onPressedLoginEvent(
      OnPressedLoginEvent event, Emitter<LoginState> emit) async {
    _logger.debug("onPressedLoginEvent");
    final String inputEmail = event.email;
    final String inputPassword = event.password;

    _logger.debug("email: $inputEmail, password: $inputPassword");

    await _postLogin(emit, email: inputEmail, password: inputPassword);
  }

  Future<void> _postLogin(Emitter<LoginState> emit,
      {required String email, required String password}) async {
    _logger.debug("postLogin");

    try {
      emit(state.copyWith(postLoginStatus: PostLoginStatus.loading));

      final SignInDtoRequest signInDtoRequest = SignInDtoRequest(
        username: email,
        password: password,
      );

      final SignInDtoResponse signInDtoResponse =
          await _authRepository.postSignIn(signInDtoRequest: signInDtoRequest);
      final String accessToken = signInDtoResponse.token.accessToken;
      final String refreshToken = signInDtoResponse.token.refreshToken;
      _logger.debug("accessToken: $accessToken, refreshToken: $refreshToken");

      await _appSecureStorage.save(
          SecureStorageKeys.accessToken.name, accessToken);
      await _appSecureStorage.save(
          SecureStorageKeys.refreshToken.name, refreshToken);

      emit(state.copyWith(postLoginStatus: PostLoginStatus.success));
    } on DioException catch (e) {
      _logger.error(e.toString());
      _logger.error("diotype: ${e.type}");
      _logger.error("diocode: ${e.response?.statusCode}");

      emit(state.copyWith(
          postLoginStatus: PostLoginStatus.failure,
          dioTypePostLogin: e.type,
          dioCodePostLogin: e.response?.statusCode));
    } catch (e) {
      _logger.error(e.toString());
      emit(state.copyWith(
          postLoginStatus: PostLoginStatus.failure,
          dioTypePostLogin: DioExceptionType.unknown,
          dioCodePostLogin: 0));
    }
  }
}
