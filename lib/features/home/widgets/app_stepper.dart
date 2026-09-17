import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:ecommerce/features/home/controllers/cart_controller.dart';
import 'package:ecommerce/shared/app_colors.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppStepper extends StatelessWidget {
  const AppStepper({super.key, required this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, cartController, child) {
        return Row(
          children: [
            ElevatedButton(
              onPressed: () {
                try {
                  cartController.decreaseQuantityOf(item);
                } on StateError {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Atenção'),
                        content: Text(
                          'Deseja remover ${item.product.name} do carrinho?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                            child: Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () {
                              cartController.removeProduct(item.product);
                              AnimatedSnackBar.material(
                                'Produto removido',
                                type: AnimatedSnackBarType.success,
                                mobileSnackBarPosition:
                                    MobileSnackBarPosition.bottom,
                                duration: Duration(
                                  seconds: 2,
                                  milliseconds: 500,
                                ),
                              ).show(context);
                              Navigator.pop(context, true);
                            },
                            child: Text('Remover'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: AppColors.black,
                foregroundColor: AppColors.white,
                textStyle: AppTextStyle.buttonLabel,
              ),
              child: Text('-'),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Text(item.quantity.toString()),
            ),
            ElevatedButton(
              onPressed: () {
                cartController.increaseQuantityOf(item);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: AppColors.black,
                foregroundColor: AppColors.white,
                textStyle: AppTextStyle.buttonLabel,
              ),
              child: Text('+'),
            ),
          ],
        );
      },
    );
  }
}
