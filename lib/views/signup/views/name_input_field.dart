import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sortcoff/global/constants/app_colors.dart';
import 'package:sortcoff/global/typography/typography.dart';
import 'package:sortcoff/bloc/sign%20up/basic_auth_bloc.dart';

class NameInputField extends StatefulWidget {
  const NameInputField({
    super.key,
    required this.isNameValid,
    required this.onNameValidationChanged,
  });

  final bool isNameValid;
  final ValueChanged<bool> onNameValidationChanged;

  @override
  // ignore: library_private_types_in_public_api
  _NameInputFieldState createState() => _NameInputFieldState();
}

class _NameInputFieldState extends State<NameInputField> {
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

  void _checkNameValidity(String value) {
    final isValid = _isValidName(value);
    widget.onNameValidationChanged(isValid);
  }

  bool _isValidName(String value) {
    final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
    return nameRegex.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onChanged: (value) {
        _checkNameValidity(value);
        context.read<VM_SignUp>().add(NameChanged(value));
      },
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        hintStyle: AppTypoGraphy.getTextStyle(
          color: AppColors.lightGrey,
          fontSize: 18,
        ),
        hintText: 'Name',
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
