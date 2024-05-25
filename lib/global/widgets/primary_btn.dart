import 'package:flutter/material.dart';
import 'package:sortcoff/global/constants/app_colors.dart';
import 'package:sortcoff/global/typography/typography.dart';

class PrimaryBtn extends StatelessWidget {
  const PrimaryBtn({
    required this.text,
    required this.ontap,
    this.disabled = false,
    super.key,
  });

  final String text;
  final VoidCallback? ontap;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : ontap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: disabled ? Colors.grey : AppColors.blue,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Align(
          child: Text(
            text,
            style: AppTypoGraphy.getTextStyle(
              weight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
