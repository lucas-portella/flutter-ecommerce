import 'package:ecommerce/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class AppPasswordRequirement extends StatelessWidget {
  const AppPasswordRequirement({
    super.key,
    required this.isValidated,
    required this.label,
  });

  final bool isValidated;
  final String label;

  final String _pathValidatedImage = 'assets/images/image 5.png';
  final String _pathNotValidatedImage = 'assets/images/image 6.png';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(isValidated ? _pathValidatedImage : _pathNotValidatedImage),
        SizedBox(width: 4),
        Text(
          label,
          style: isValidated
              ? AppTextStyle.validatedAppRequirement
              : AppTextStyle.notValidatedAppRequirement,
        ),
      ],
    );
  }
}
