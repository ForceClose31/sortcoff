import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sortcoff/global/constants/app_colors.dart';
import 'package:sortcoff/global/typography/typography.dart';
import 'package:sortcoff/bloc/login/signin_auth_bloc.dart';

class PwdInputField extends StatefulWidget {
  const PwdInputField({
    Key? key,
  }) : super(key: key);

  @override
  _PwdInputFieldState createState() => _PwdInputFieldState();
}

class _PwdInputFieldState extends State<PwdInputField> {
  late TextEditingController _controller;
  bool _obscureText = true;
  bool _showPassword = false;

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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _controller,
          onChanged: (value) =>
              context.read<VM_Login>().add(PasswordChanged(value)),
          obscureText: _obscureText,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            hintStyle: AppTypoGraphy.getTextStyle(
              color: AppColors.lightGrey,
              fontSize: 18,
            ),
            hintText: 'Password',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: AppColors.white,
              ),
            ),
          ),
        ),
        CheckboxListTile(
          title: Text('Show Password'),
          value: _showPassword,
          onChanged: (value) {
            setState(() {
              _showPassword = value!;
              _obscureText = !value;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
