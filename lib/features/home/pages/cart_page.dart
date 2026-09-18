import 'package:ecommerce/features/home/controllers/cart_controller.dart';
import 'package:ecommerce/features/home/widgets/app_stepper.dart';
import 'package:ecommerce/features/home/widgets/cart_item_card.dart';
import 'package:ecommerce/features/home/widgets/order_price_hero.dart';
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

          if (cartItems.isEmpty) {
            return Center(child: Text('Seu carrinho está vazio'));
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 120,
              width: 370,
              child: PageView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  CartItem item = cartItems[index];

                  return CartItemCard(item: item);
                },
              ),
            ),
          );
        },
      ),

      bottomNavigationBar: SafeArea(
        child: Consumer<CartController>(
          builder: (context, cartController, child) {
            final orderPrice = cartController.getTotalPrice();

            if (orderPrice == 0) {
              return Text('');
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OrderPriceHero(orderPrice: orderPrice),
                  AppElevatedButton(
                    buttonText: 'Continuar',
                    type: ButtonType.filled,
                    onPressed: () {},
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
