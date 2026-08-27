import 'package:ecommerce/features/home/controllers/home_page_controller.dart';
import 'package:ecommerce/features/home/models/category_model.dart';
import 'package:ecommerce/features/home/models/products_model.dart';
import 'package:ecommerce/pages/loginPage/controller/login_page_controller.dart';
import 'package:ecommerce/shared/app_colors.dart';
import 'package:ecommerce/shared/app_text_style.dart';
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
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ],
        title: Consumer<LoginPageController>(
          builder: (context, loginController, child) {
            return Text(
              'Olá, ${loginController.user!.nome}',
              style: AppTextStyle.homePageTitle,
            );
          },
        ),
      ),
      body: Consumer<HomePageController>(
        builder: (context, homeController, child) {
          return Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Column(
              children: [
                ListViewLabel(label: 'Categorias'),
                SizedBox(
                  height: 200,
                  child: switch (homeController.categoriesState) {
                    CategoriesView.loading => CircularProgressIndicator(),
                    CategoriesView.error => Text(
                      'Problema ao resgatar categorias',
                    ),
                    CategoriesView.success => SizedBox(
                      child: ListView.builder(
                        itemCount: homeController.categories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          Category category = homeController.categories[index];
                          return Container(
                            margin: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Image.network(category.imageUrl),
                                Text(
                                  category.name,
                                  style: AppTextStyle.subtitle,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  },
                ),
                ListViewLabel(label: 'Produtos'),
                SizedBox(
                  height: 400,
                  child: switch (homeController.productsState) {
                    ProductsView.loading => CircularProgressIndicator(),
                    ProductsView.error => Text('Problema ao resgatar produtos'),
                    ProductsView.success => SizedBox(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeController.products.length,
                        itemBuilder: (context, index) {
                          Product product = homeController.products[index];
                          print(product.name);
                          return Container(
                            margin: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Image.network(product.imageUrl),
                                Text(product.brand),
                                Text(product.name),
                                Text('\$ ${product.price.toString()}'),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  },
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
