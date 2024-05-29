import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sortcoff/global/constants/app_colors.dart';
import 'package:sortcoff/global/typography/typography.dart';
import 'package:sortcoff/views/signup/blocs/basic_auth/basic_auth_bloc.dart';

class PhoneInputField extends StatefulWidget {
  const PhoneInputField({
    super.key,
    required this.isPhoneValid,
    required this.onPhoneValidationChanged,
  });

  final bool isPhoneValid;
  final ValueChanged<bool> onPhoneValidationChanged;

  @override
  // ignore: library_private_types_in_public_api
  _PhoneInputFieldState createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {
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

  void _checkPhoneValidity(String value) {
    final isValid = _isValidPhone(value);
    widget.onPhoneValidationChanged(isValid);
  }

  bool _isValidPhone(String value) {
    // This is a basic Phone validation logic, you can replace it with your own validation logic
    // ignore: non_constant_identifier_Phones
    final PhoneRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return PhoneRegex.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onChanged: (value) {
        _checkPhoneValidity(value);
        context.read<BasicAuthBloc>().add(PhoneChanged(value));
      },
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        hintStyle: AppTypoGraphy.getTextStyle(
          color: AppColors.lightGrey,
          fontSize: 18,
        ),
        hintText: 'Phone',
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
