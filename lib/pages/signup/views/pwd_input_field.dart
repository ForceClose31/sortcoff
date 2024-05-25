import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sortcoff/global/constants/app_colors.dart';
import 'package:sortcoff/global/typography/typography.dart';
import 'package:sortcoff/pages/signup/blocs/basic_auth/basic_auth_bloc.dart';

class PwdInputField extends StatefulWidget {
  final bool isPasswordValid; // Tambahkan properti untuk validasi password
  final void Function(bool)
      onPasswordValidationChanged; // Callback untuk mengirim validasi password ke atas

  const PwdInputField({
    Key? key,
    required this.isPasswordValid,
    required this.onPasswordValidationChanged,
  }) : super(key: key);

  @override
  _PwdInputFieldState createState() => _PwdInputFieldState();
}

class _PwdInputFieldState extends State<PwdInputField> {
  late TextEditingController _controller;
  bool _obscureText = true;

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

  void _checkPasswordStrength(String value) {
    final isPasswordWeak = value.length < 6;
    final isPasswordStrong =
        !isPasswordWeak && _containsNumbers(value) && _containsUppercase(value);
    widget.onPasswordValidationChanged(
        isPasswordStrong); // Mengirim hasil validasi ke atas
  }

  bool _containsNumbers(String value) {
    return RegExp(r'\d').hasMatch(value);
  }

  bool _containsUppercase(String value) {
    return value != value.toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onChanged: (value) {
        _checkPasswordStrength(value);
        context.read<BasicAuthBloc>().add(PasswordChanged(value));
      },
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
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: AppColors.black,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: AppColors.lightGrey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: AppColors.lightGrey,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
