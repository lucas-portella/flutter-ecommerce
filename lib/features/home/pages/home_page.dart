import 'package:ecommerce/features/home/controllers/home_page_controller.dart';
import 'package:ecommerce/pages/loginPage/controller/login_page_controller.dart';
import 'package:ecommerce/shared/app_text_style.dart';
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
    context.read<HomePageController>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<LoginPageController>(
          builder: (context, loginController, child) {
            return Text(
              'Olá, ${loginController.user!.nome}',
              style: AppTextStyle.title,
            );
          },
        ),
      ),
      body: Consumer<HomePageController>(
        builder: (context, homeController, child) {
          return Column(
            children: [
              SizedBox(
                height: 108,
                child: switch (homeController.categoriesState) {
                  CategoriesView.loading => CircularProgressIndicator(),
                  CategoriesView.error => Text(
                    'Problema ao resgatar categorias',
                  ),
                  CategoriesView.success => Container(
                    color: Colors.red,
                    width: 100,
                    height: 100,
                  ),
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
