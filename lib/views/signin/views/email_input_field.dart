import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sortcoff/global/constants/app_colors.dart';
import 'package:sortcoff/global/typography/typography.dart';
import 'package:sortcoff/bloc/login/signin_auth_bloc.dart';

class EmailInputField extends StatelessWidget {
  const EmailInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => context.read<VM_Login>().add(EmailChanged(value)),
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
