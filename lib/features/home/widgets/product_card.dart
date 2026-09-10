import 'package:ecommerce/features/home/models/products_model.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!context.mounted) return;
        final bool? result = await showModalBottomSheet<bool>(
          enableDrag: true,
          showDragHandle: true,
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return FractionallySizedBox(
              heightFactor: 0.8,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsetsGeometry.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 2,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 250,
                        width: double.infinity,
                        child: Image.network(
                          product.imageUrl,
                          // width: MediaQuery.of(context).size.width * 2 / 3,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(product.name, style: AppTextStyle.title),
                      Text(product.brand, style: AppTextStyle.subtitle),
                      Text(product.description),
                      Text(
                        'R\$ ${product.price.toString()}',
                        style: AppTextStyle.title,
                      ),
                      Spacer(),
                      AppElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, true); // retorno do modal
                        },
                        buttonText: 'Adicionar ao carrinho',
                        type: ButtonType.filled,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );

        print(result);
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Skeleton.replace(
                width: 150,
                height: 150,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    product.imageUrl,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(product.brand, style: AppTextStyle.subtitle),
            Text(product.name, style: AppTextStyle.subtitle),
            Text(
              '\$${product.price.toStringAsFixed(2).replaceAll('.', ',')}',
              style: AppTextStyle.subtitle,
            ),
          ],
        ),
      ),
    );
  }
}
