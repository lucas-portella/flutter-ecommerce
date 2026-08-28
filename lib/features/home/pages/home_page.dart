import 'package:ecommerce/features/home/controllers/home_page_controller.dart';
import 'package:ecommerce/features/home/models/products_model.dart';
import 'package:ecommerce/features/home/widgets/categories_section.dart';
import 'package:ecommerce/features/home/widgets/home_page_title.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:ecommerce/shared/widgets/list_view_label.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
        title: HomePageTitle(),
      ),
      body: Consumer<HomePageController>(
        builder: (context, homeController, child) {
          CategorySectionStateView categoryState =
              (homeController.categoriesState == CategoriesView.error
              ? CategorySectionStateView.error
              : (homeController.categoriesState == CategoriesView.success
                    ? CategorySectionStateView.success
                    : CategorySectionStateView.loading));
          return Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Column(
              children: [
                ListViewLabel(label: 'Categorias'),
                CategoriesSection(
                  categories: homeController.categories,
                  state: categoryState,
                ),
                ListViewLabel(label: 'Produtos'),
                SizedBox(
                  height: 400,
                  child: switch (homeController.productsState) {
                    ProductsView.loading => Skeletonizer(
                      enabled: true,
                      enableSwitchAnimation: true,
                      child: SizedBox(
                        child: ListView.builder(
                          itemCount: homeController.products.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                spacing: 4,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 150,
                                    height: 150,
                                    child: Bone.square(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Bone.text(
                                    style: AppTextStyle.productBrandStyle,
                                  ),
                                  Bone.text(
                                    style: AppTextStyle.productNameStyle,
                                  ),
                                  Bone.text(
                                    style: AppTextStyle.productPriceStyle,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    ProductsView.error => Text('Problema ao resgatar produtos'),
                    ProductsView.success => SizedBox(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeController.products.length,
                        itemBuilder: (context, index) {
                          Product product = homeController.products[index];
                          return Container(
                            margin: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(product.imageUrl),
                                Text(
                                  product.brand,
                                  style: AppTextStyle.productBrandStyle,
                                ),
                                Text(
                                  product.name,
                                  style: AppTextStyle.productNameStyle,
                                ),
                                Text(
                                  '\$ ${product.price.toString()}',
                                  style: AppTextStyle.productPriceStyle,
                                ),
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
