import 'package:ecommerce/shared/app_colors.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:flutter/material.dart';

enum ButtonType { filled, outlined }

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.type,
  });

  final VoidCallback onPressed;
  final ButtonType type;
  final String buttonText;

  ButtonStyle _getStyle() {
    switch (type) {
      case ButtonType.filled:
        return ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: AppColors.black,
          foregroundColor: AppColors.white,
          textStyle: AppTextStyle.buttonLabel,
          minimumSize: Size.fromHeight(40),
        );
      case ButtonType.outlined:
        return ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.black,
          textStyle: AppTextStyle.buttonLabel,
          minimumSize: Size.fromHeight(40),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: _getStyle(),
      child: Text(buttonText),
    );
  }
}
