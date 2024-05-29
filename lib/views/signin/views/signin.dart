import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sortcoff/lc.dart';
import 'package:sortcoff/bloc/login/signin_auth_bloc.dart';

import 'signin_page_body.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              SigninAuthBloc(lc(), context), // Tambahkan BuildContext di sini
        ),
      ],
      child: const _Signin(),
    );
  }
}

class _Signin extends StatelessWidget {
  const _Signin();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          SigninPageBody(),
        ],
      ),
    );
  }
}
