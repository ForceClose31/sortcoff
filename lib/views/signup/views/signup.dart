import 'package:flutter/material.dart';
import 'package:sortcoff/global/constants/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sortcoff/lc.dart';
import 'package:sortcoff/bloc/sign%20up/basic_auth_bloc.dart';
import 'signup_page_body.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VM_SignUp(lc()),
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
    return Scaffold(
      body: Stack(
        children: [
          _buildBgImg(context),
          _buildBgOverlay(context),
          const SignUpPageBody(),
        ],
      ),
    );
  }

  Container _buildBgOverlay(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      color: AppColors.black.withOpacity(0.5),
    );
  }

  SizedBox _buildBgImg(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Image.asset(
        'assets/imgs/splash/splash.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
