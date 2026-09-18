import 'package:ecommerce/features/home/controllers/cart_controller.dart';
import 'package:ecommerce/features/home/widgets/app_stepper.dart';
import 'package:ecommerce/shared/app_colors.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.black, width: 1),
      ),
      child: Row(
        children: [
          Image.network(item.product.imageUrl, width: 115, height: 105),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.product.name,
                            style: AppTextStyle.cartProductName,
                          ),
                          Text(
                            item.product.brand,
                            style: AppTextStyle.cartProductBrand,
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        'R\$ ${item.getSubtotal().toString()}',
                        style: AppTextStyle.cartProductSubtotal,
                      ),
                    ],
                  ),
                ),
                AppStepper(item: item),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
