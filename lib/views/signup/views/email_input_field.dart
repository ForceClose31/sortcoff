import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sortcoff/global/constants/app_colors.dart';
import 'package:sortcoff/global/typography/typography.dart';
import 'package:sortcoff/bloc/sign%20up/basic_auth_bloc.dart';

class EmailInputField extends StatefulWidget {
  const EmailInputField({
    super.key,
    required this.isEmailValid,
    required this.onEmailValidationChanged,
  });

  final bool isEmailValid;
  final ValueChanged<bool> onEmailValidationChanged;

  @override
  _EmailInputFieldState createState() => _EmailInputFieldState();
}

class _EmailInputFieldState extends State<EmailInputField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _checkEmailValidity(String value) {
    final isValid = _isValidEmail(value);
    widget.onEmailValidationChanged(isValid);
  }

  bool _isValidEmail(String value) {
    // This is a basic email validation logic, you can replace it with your own validation logic
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onChanged: (value) {
        _checkEmailValidity(value);
        context.read<BasicAuthBloc>().add(EmailChanged(value));
      },
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        hintStyle: AppTypoGraphy.getTextStyle(
          color: AppColors.lightGrey,
          fontSize: 18,
        ),
        hintText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
