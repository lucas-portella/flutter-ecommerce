import 'package:ecommerce/shared/app_colors.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class ListViewLabel extends StatelessWidget {
  final String label;
  const ListViewLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      children: [
        Text(label, style: AppTextStyle.homePageTitle),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.grey100,
          ),
          child: Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}
