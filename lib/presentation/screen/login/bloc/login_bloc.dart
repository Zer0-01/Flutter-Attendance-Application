import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_attendance_application/configuration/app_logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AppLogger _logger = AppLogger.getLogger("LoginBloc");

  LoginBloc() : super(const LoginState()) {
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

      emit(state.copyWith(postLoginStatus: PostLoginStatus.success));
    } on DioException catch (e) {
      _logger.error(e.toString());
      _logger.error("diotype: ${e.type}");
      _logger.error("diocode: ${e.response?.statusCode}");

      emit(state.copyWith(postLoginStatus: PostLoginStatus.failure));
    } catch (e) {
      _logger.error(e.toString());
      emit(state.copyWith(postLoginStatus: PostLoginStatus.failure));
    }
  }
}
