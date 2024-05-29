part of 'signin_auth_bloc.dart';

@immutable
sealed class SigninAuthEvent {}

final class EmailChanged extends SigninAuthEvent {
  EmailChanged(this.email);
  final String email;
}

final class PasswordChanged extends SigninAuthEvent {
  PasswordChanged(this.password);
  final String password;
}

final class FormSubmit extends SigninAuthEvent {}
