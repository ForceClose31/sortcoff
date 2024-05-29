part of 'basic_auth_bloc.dart';

enum FormStatus {
  initial,
  pending,
  success,
  error,
}

@immutable
final class BasicAuthState {
  const BasicAuthState({
    this.email = "",
    this.name = "",
    this.phone = "",
    this.password = "",
    this.status = FormStatus.initial,
    this.errorMsg,
  });
  final String email;
  final String name;
  final String phone;
  final String password;
  final FormStatus status;
  final String? errorMsg;

  BasicAuthState copyWith({
    String? email,
    String? name,
    String? phone,
    String? password,
    FormStatus? status,
    String? errorMsg,
  }) =>
      BasicAuthState(
        email: email ?? this.email,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        status: status ?? this.status,
        errorMsg: errorMsg ?? this.errorMsg,
      );
}
