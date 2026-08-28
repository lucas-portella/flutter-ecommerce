import 'package:ecommerce/shared/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static const TextStyle title = TextStyle(
    color: AppColors.black,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitle = TextStyle(
    color: AppColors.black,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle buttonLabel = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle textSpan = TextStyle(
    color: AppColors.grey600,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle highlightedTextSpan = TextStyle(
    color: AppColors.black,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle validatedAppRequirement = TextStyle(
    color: AppColors.green,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle notValidatedAppRequirement = TextStyle(
    color: AppColors.black,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle homePageTitle = TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle productBrandStyle = TextStyle(
    color: AppColors.grey600,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle productNameStyle = TextStyle(
    color: AppColors.black,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle productPriceStyle = TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}
