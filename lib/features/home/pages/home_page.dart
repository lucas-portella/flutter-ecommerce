import 'package:ecommerce/features/home/controllers/home_page_controller.dart';
import 'package:ecommerce/features/home/widgets/categories_section.dart';
import 'package:ecommerce/features/home/widgets/home_page_title.dart';
import 'package:ecommerce/features/home/widgets/products_section.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:ecommerce/shared/widgets/list_view_label.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static String route = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      context.read<HomePageController>()
        ..getCategories()
        ..getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ],
        title: HomePageTitle(),
      ),
      body: Consumer<HomePageController>(
        builder: (context, homeController, child) {
          return Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Column(
              children: [
                ListViewLabel(label: 'Categorias'),
                CategoriesSection(
                  categories: homeController.categories,
                  state: homeController.categoriesState,
                ),
                ProductsSection(
                  state: homeController.productsState,
                  products: homeController.products,
                ),
                AppElevatedButton(
                  onPressed: () {
                    homeController
                      ..getCategories()
                      ..getProducts();
                  },
                  buttonText: 'Recarregar categorias',
                  type: ButtonType.filled,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
