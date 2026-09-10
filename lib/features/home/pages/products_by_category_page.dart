import 'package:ecommerce/features/home/controllers/products_by_category_controller.dart';
import 'package:ecommerce/features/home/models/products_model.dart';
import 'package:ecommerce/features/home/widgets/product_card.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsByCategoryPage extends StatefulWidget {
  static final String route = '/products-by-category';
  final String categoryName;

  const ProductsByCategoryPage({super.key, required this.categoryName});

  @override
  State<ProductsByCategoryPage> createState() => _ProductsByCategoryPageState();
}

class _ProductsByCategoryPageState extends State<ProductsByCategoryPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductsByCategoryController>().getProductsFromCategory(
        widget.categoryName,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName, style: AppTextStyle.title),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: Consumer<ProductsByCategoryController>(
        builder: (context, controller, child) {
          final List<Product> fakeProducts = List.filled(
            4,
            Product(
              brand: 'Marca do produto',
              name: 'Nome do produto',
              imageUrl: '',
              price: 0,
              category: '',
              description: '',
            ),
          );

          if (controller.state == ProductsByCategoryStateView.error) {
            return Center(child: Text('Problema ao resgatar produtos'));
          }
          final isLoading =
              controller.state == ProductsByCategoryStateView.loading;

          final products = isLoading ? fakeProducts : controller.products;

          if (!isLoading && products.isEmpty) {
            return Center(child: Text('Nenhum produto encontrado'));
          }

          return Skeletonizer(
            enabled: isLoading,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.62,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) =>
                  ProductCard(product: products[index]),
            ),
          );
        },
      ),
    );
  }
}
