import 'package:ecommerce/features/home/controllers/cart_controller.dart';
import 'package:ecommerce/features/home/widgets/app_stepper.dart';
import 'package:ecommerce/shared/app_colors.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  static String route = '/cart';
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carrinho')),
      body: Consumer<CartController>(
        builder: (context, cartController, child) {
          final cartItems = cartController.cartItems;
          final totalPrice = cartController.getTotalPrice();

          if (cartItems.isEmpty) {
            return Center(child: Text('Seu carrinho está vazio'));
          }

          return SafeArea(
            child: ListView(
              padding: EdgeInsets.all(8),
              children: [
                for (var item in cartItems) ...[
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 4),
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.black),
                    ),
                    child: Row(
                      children: [
                        Image.network(
                          item.product.imageUrl,
                          width: 115,
                          height: 105,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      item.product.name,
                                      style: TextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      item.product.brand,
                                      style: TextStyle(
                                        color: AppColors.grey600,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  item.getSubtotal().toString(),
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                            Center(child: AppStepper(item: item)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total:', style: TextStyle(fontSize: 18)),
                      Text(
                        'R\$ ${totalPrice.toString()}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppElevatedButton(
                    onPressed: () {
                      // Implement checkout functionality here
                    },
                    buttonText: 'Finalizar Compra',
                    type: ButtonType.filled,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
