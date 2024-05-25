part of 'signin_auth_bloc.dart';

enum FormStatus {
  initial,
  pending,
  success,
  error,
}

@immutable
final class SigninAuthState {
  const SigninAuthState({
    this.email = "",
    this.password = "",
    this.status = FormStatus.initial,
    this.errorMsg,
  });
  final String email;
  final String password;
  final FormStatus status;
  final String? errorMsg;

  SigninAuthState copyWith({
    String? email,
    String? password,
    FormStatus? status,
    String? errorMsg,
  }) =>
      SigninAuthState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        errorMsg: errorMsg ?? this.errorMsg,
      );
}
