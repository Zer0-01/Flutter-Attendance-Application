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
  }
}
