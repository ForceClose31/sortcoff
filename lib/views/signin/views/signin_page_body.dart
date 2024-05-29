import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sortcoff/global/widgets/primary_btn.dart';
import 'package:sortcoff/bloc/login/signin_auth_bloc.dart';
import 'package:sortcoff/repos/auth_repo/auth_repo.dart';

import 'email_input_field.dart';
import 'pwd_input_field.dart';

class SigninPageBody extends StatelessWidget {
  const SigninPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthRepo _authRepo = AuthRepo();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Stack(
            children: [
              Positioned(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/background/bg1.png'),
                      opacity: 0.5,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/content/img3.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 40,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width * 1,
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Username',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const EmailInputField(),
                        const Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const PwdInputField(),
                        const SizedBox(
                          height: 30,
                        ),
                        PrimaryBtn(
                          text: 'Login',
                          ontap: () async {
                            final email =
                                context.read<SigninAuthBloc>().state.email;
                            final password =
                                context.read<SigninAuthBloc>().state.password;
                            if (email.isEmpty || password.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Masukkan Data dengan Benar'),
                                ),
                              );
                            } else {
                              context.read<SigninAuthBloc>().add(FormSubmit());
                              // Tambahkan try-catch untuk menangkap pengecualian Firebase
                              try {
                                await _authRepo.signInWithUsernamePassword(
                                    email, password);
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Masukkan Data dengan Benar'),
                                  ),
                                );
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
