import 'package:ecommerce/shared/app_colors.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.onPressed,
    required this.blackBackground,
    required this.buttonText,
  });

  final VoidCallback onPressed;
  final bool blackBackground;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: (blackBackground ? AppColors.black : AppColors.white),
        foregroundColor: (blackBackground ? AppColors.white : AppColors.black),
        textStyle: AppTextStyle.buttonLabel,
        minimumSize: Size.fromHeight(40),
      ),
      child: Text(buttonText),
    );
  }
}
