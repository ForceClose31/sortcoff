import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sortcoff/global/widgets/primary_btn.dart';
import 'package:sortcoff/views/signin/views/signin.dart';
import 'package:sortcoff/bloc/sign%20up/basic_auth_bloc.dart';

import 'email_input_field.dart';
import 'name_input_field.dart';
import 'phone_input_field copy.dart';
import 'pwd_input_field.dart';

class SignUpPageBody extends StatefulWidget {
  const SignUpPageBody({
    super.key,
  });

  @override
  _SignUpPageBodyState createState() => _SignUpPageBodyState();
}

class _SignUpPageBodyState extends State<SignUpPageBody> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  bool _isPasswordValid = false;
  bool _isNameValid = false;
  bool _isPhoneValid = false;
  bool _isEmailValid = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _checkPasswordStrength(String value) {
    setState(() {
      _isPasswordValid = _isValidPassword(value);
    });
  }

  bool _isValidPassword(String value) {
    // Modify this as needed for your password strength validation
    return value.length >= 6;
  }

  void _checkEmailValidity(String value) {
    setState(() {
      _isEmailValid = _isValidEmail(value);
    });
  }

  bool _isValidEmail(String value) {
    // This is a basic email validation logic, you can replace it with your own validation logic
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(value);
  }

  void _checkNameValidity(String value) {
    setState(() {
      _isNameValid = _isValidName(value);
    });
  }

  bool _isValidName(String value) {
    // This is a basic email validation logic, you can replace it with your own validation logic
    final nameRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return nameRegex.hasMatch(value);
  }

  void _checkPhoneValidity(String value) {
    setState(() {
      _isPhoneValid = _isValidPhone(value);
    });
  }

  bool _isValidPhone(String value) {
    // This is a basic email validation logic, you can replace it with your own validation logic
    final phoneRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return phoneRegex.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Stack(
            children: [
              Positioned(
                top: 10,
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
                    'Sign Up',
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
                          'Nama',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        NameInputField(
                          isNameValid: _isNameValid,
                          onNameValidationChanged: (isValid) {
                            setState(() {
                              _isNameValid = isValid;
                            });
                          },
                        ),
                        const Text(
                          'Nomor Telepon',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        PhoneInputField(
                          isPhoneValid: _isPhoneValid,
                          onPhoneValidationChanged: (isValid) {
                            setState(() {
                              _isPhoneValid = isValid;
                            });
                          },
                        ),
                        const Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        EmailInputField(
                          isEmailValid: _isEmailValid,
                          onEmailValidationChanged: (isValid) {
                            setState(() {
                              _isEmailValid = isValid;
                            });
                          },
                        ),
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
                        PwdInputField(
                          isPasswordValid: _isPasswordValid,
                          onPasswordValidationChanged: (isValid) {
                            setState(() {
                              _isPasswordValid = isValid;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        PrimaryBtn(
                          text: 'Sign Up',
                          ontap: () {
                            final email =
                                context.read<BasicAuthBloc>().state.email;
                            final password =
                                context.read<BasicAuthBloc>().state.password;
                            if (email.isEmpty ||
                                password.isEmpty ||
                                !_isEmailValid ||
                                !_isNameValid ||
                                !_isPhoneValid) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Masukkan Data dengan Benar'),
                                ),
                              );
                            } else {
                              context.read<BasicAuthBloc>().add(FormSubmit());
                              // Navigasi ke halaman login setelah sign up selesai
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SigninPage(),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
