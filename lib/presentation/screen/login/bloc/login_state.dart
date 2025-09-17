part of 'login_bloc.dart';

enum PostLoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  final PostLoginStatus postLoginStatus;

  const LoginState({
    this.postLoginStatus = PostLoginStatus.initial,
  });

  LoginState copyWith({
    PostLoginStatus? postLoginStatus,
  }) {
    return LoginState(
      postLoginStatus: postLoginStatus ?? this.postLoginStatus,
    );
  }

  @override
  List<Object> get props => [
        postLoginStatus,
      ];
}
