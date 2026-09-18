import 'package:ecommerce/shared/app_colors.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class OrderPriceHero extends StatelessWidget {
  const OrderPriceHero({super.key, required this.orderPrice});

  final double orderPrice;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'orderPrice',
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.grey600),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 6,
          children: [
            Text(
              'Total do pedido',
              style: AppTextStyle.cartBottomNavBarLabelStyle,
            ),
            Text(
              'R\$ ${orderPrice.toString()}',
              style: AppTextStyle.cartBottomNavBarPriceStyle,
            ),
          ],
        ),
      ),
    );
  }
}
