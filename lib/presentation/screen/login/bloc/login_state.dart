part of 'login_bloc.dart';

enum PostLoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  final PostLoginStatus postLoginStatus;
  final DioExceptionType dioTypePostLogin;
  final int dioCodePostLogin;

  const LoginState({
    this.postLoginStatus = PostLoginStatus.initial,
    this.dioTypePostLogin = DioExceptionType.unknown,
    this.dioCodePostLogin = 0,
  });

  LoginState copyWith({
    PostLoginStatus? postLoginStatus,
    DioExceptionType? dioTypePostLogin,
    int? dioCodePostLogin,
  }) {
    return LoginState(
      postLoginStatus: postLoginStatus ?? this.postLoginStatus,
      dioTypePostLogin: dioTypePostLogin ?? this.dioTypePostLogin,
      dioCodePostLogin: dioCodePostLogin ?? this.dioCodePostLogin,
    );
  }

  @override
  List<Object> get props => [
        postLoginStatus,
        dioTypePostLogin,
        dioCodePostLogin,
      ];
}
