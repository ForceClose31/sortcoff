import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sortcoff/views/home/views/homepage.dart';
import 'package:sortcoff/repos/auth_repo/auth_repo.dart';

part 'signin_auth_event.dart';
part 'signin_auth_state.dart';

class VM_Login extends Bloc<SigninAuthEvent, SigninAuthState> {
  final AuthRepo _authRepo;
  final BuildContext context;

  VM_Login(this._authRepo, this.context) : super(const SigninAuthState()) {
    on<EmailChanged>(_emailChanged);
    on<PasswordChanged>(_pwdChanged);
    on<FormSubmit>(_formSubmit);
  }

  void _emailChanged(EmailChanged event, Emitter<SigninAuthState> emit) {
    final newValueForEmail = event.email;
    final newState = state.copyWith(email: newValueForEmail);
    emit(newState);
  }

  void _pwdChanged(PasswordChanged event, Emitter<SigninAuthState> emit) {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _formSubmit(
      FormSubmit event, Emitter<SigninAuthState> emit) async {
    final email = state.email;
    final password = state.password;
    if (email.isEmpty || password.isEmpty) {
      emit(state.copyWith(
        status: FormStatus.error,
        errorMsg: 'Please enter your email and password.',
      ));
      return;
    }

    emit(state.copyWith(status: FormStatus.pending));

    try {
      final user = await _authRepo.signInWithUsernamePassword(email, password);
      if (user != null) {
        emit(state.copyWith(status: FormStatus.success));
        // Navigate to Home Page only if sign in is successful
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        emit(state.copyWith(
          status: FormStatus.error,
          errorMsg: 'Invalid email or password. Please try again.',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: FormStatus.error,
        errorMsg: 'An error occurred while signing in. Please try again later.',
      ));
    }
  }
}
